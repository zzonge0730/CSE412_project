# MoveC γ 문제 해결 진행 상황

## 문제 요약

**현재 상태**: `PDG::setEntryPointAt`에서 segfault 발생
- 위치: `PDG::setEntryPointAt(llvm::Function&) + 16`
- 환경: Docker 컨테이너 내에서 발생 (Ubuntu 20.04)
- 입력: `MoveC-movec.bc` (MoveC로 생성된 LLVM IR)
- 간단한 IR (`define i32 @main() { ret i32 0 }`)에서도 발생 → 근본적인 문제로 추정

## 시도한 해결 방법

### 1. setEntryPointAt에서 노드 확인 및 추가
- `setEntryPointAt`에서 노드가 없으면 `addNodesOf` 호출
- `_RV_main` 폴백 로직 추가
- 함수/기본 블록/명령어 유효성 체크 추가
- 결과: 여전히 segfault 발생

### 2. PDG 생성자에서 main 함수 노드 명시적 추가
- `PDG::PDG(Module &M)` 생성자에서 `main` 함수 노드 명시적 추가
- `_RV_main` 폴백 로직 추가
- 결과: 여전히 segfault 발생

### 3. addNodesOf 버그 수정
- `&arg_it` → `&*arg_it` 수정 (인자 처리 버그)
- 결과: 여전히 segfault 발생

### 4. DGBase.h 버그 수정
- `DG<T>::fetchNode`의 assert 버그 수정: `assert(theT == nullptr ...)` → `assert(theT != nullptr ...)`
- 결과: 여전히 segfault 발생

### 5. 빌드 에러 수정
- `Module *M` 중복 선언 제거
- 불필요한 `&F == nullptr` 체크 제거
- 결과: 빌드 성공

### 6. setEntryPointAt 완전 재작성 (2025-01-XX)
- `fetchNode` 대신 직접 `internalNodeMap` 접근 시도
- `isInGraph`를 사용하여 노드 존재 확인 후 `fetchNode` 호출
- 람다 함수로 안전한 진입점 노드 가져오기 로직 구현
- 결과: 여전히 segfault 발생 (`isInGraph` 호출 시점에서 발생 가능)

### 7. 디버그 출력 추가 및 근본 원인 발견 (2025-01-XX)
- `setEntryPointAt`에 상세한 디버그 출력 추가
- `F.getName()` 호출에서 segfault 발생 확인
- `PDG::PDG(Module &M)` 생성자에서 `main` 함수가 없을 때 fallback 로직 추가
- 결과: **segfault 해결됨!** `main` 함수가 없어서 fallback 함수를 사용하도록 수정

## 현재 코드 상태

### PDG::PDG(Module &M) 생성자
- 모든 함수에 대해 `addNodesOf` 호출 (필터링 제외)
- `main` 함수 노드 명시적 추가 시도
- `_RV_main` 폴백 로직 포함
- `setEntryPointAt(*mainF)` 호출

### PDG::setEntryPointAt(Function &F)
- 람다 함수 `getEntryNodeFromFunction`로 안전한 진입점 노드 가져오기
- 함수가 비어있는 경우 처리
- 첫 번째 기본 블록이 비어있는 경우 처리
- `isInGraph`로 노드 존재 확인 후 `fetchNode` 호출
- `_RV_main` 폴백 로직 포함
- 모든 함수를 순회하며 유효한 진입점 찾기

## 근본 원인 분석 필요

문제는 `setEntryPointAt`에서 발생하는 것으로 보이지만, 정확한 실패 지점을 파악하기 어렵습니다. 가능한 원인:

1. **internalNodeMap 자체의 문제**: `internalNodeMap`이 제대로 초기화되지 않았거나 손상됨
2. **포인터 유효성 문제**: `entryInst` 포인터가 유효하지 않거나 메모리 해제됨
3. **멀티스레딩 문제**: LLVM IR이 수정되는 동안 접근
4. **순환 참조 문제**: `setEntryPointAt` 내부에서 `addNodesOf` 호출 시 순환 참조 발생
5. **해시 함수 문제**: `std::unordered_map`의 해시 함수에서 `entryInst` 포인터 처리 시 문제 발생
6. **isInGraph 호출 문제**: `isInGraph`도 `internalNodeMap.find()`를 호출하므로 같은 문제 발생 가능

## 해결 완료! (2025-01-XX)

**근본 원인**: `PDG::PDG(Module &M)` 생성자에서 `main` 함수를 찾지 못했을 때 `assert(mainF != nullptr)`로 프로그램이 종료되거나, `mainF`가 `nullptr`인 상태에서 `setEntryPointAt(*mainF)`를 호출하여 segfault 발생

**해결 방법**:
1. `main` 함수가 없을 때 fallback 함수를 찾는 로직 추가
2. `setEntryPointAt`에서 `F.getName()` 호출 제거 (segfault 원인)
3. 안전한 진입점 노드 가져오기 로직 구현

**결과**: `PDGAnalysis`가 정상적으로 실행됨

## 수정된 파일

- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/PDG.cpp`:
  - `setEntryPointAt`: 완전히 재작성, 람다 함수로 안전한 진입점 노드 가져오기, `isInGraph` + `fetchNode` 사용
  - `addNodesOf`: 인자 처리 버그 수정 (`&arg_it` → `&*arg_it`)
  - `PDG::PDG(Module &M)`: main 함수 노드 명시적 추가, 폴백 로직
- `Catamaran-llvm-3.4.0/llvm/lib/Transforms/CMPass/DGBase.h`:
  - `DG<T>::fetchNode`: assert 버그 수정
