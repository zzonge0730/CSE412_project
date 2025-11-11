# MoveC γ 문제 해결 진행 상황

## 문제 분석

**현재 상태**: `PDG::setEntryPointAt`에서 segfault 발생
- 위치: `PDG::setEntryPointAt(llvm::Function&) + 20`
- 원인: `main` 함수의 첫 번째 명령어가 `internalNodeMap`에 없음

## 시도한 해결 방법

### 1차 시도: setEntryPointAt에서 노드 확인 및 추가
- `setEntryPointAt`에서 노드가 없으면 `addNodesOf` 호출
- 결과: 여전히 segfault 발생

### 2차 시도: PDG 생성자에서 main 함수 노드 명시적 추가
- `PDG::PDG(Module &M)` 생성자에서 `main` 함수 노드 명시적 추가
- 결과: 여전히 segfault 발생

## 다음 단계

문제의 근본 원인을 더 깊이 분석해야 합니다:

1. **addNodesOf 함수 확인**: `main` 함수의 노드가 실제로 추가되는지 확인
2. **인자 처리 버그 확인**: `addNodesOf`에서 `&arg_it` 대신 `&*arg_it` 사용 필요할 수 있음
3. **디버그 출력 추가**: 어느 지점에서 문제가 발생하는지 확인

## 참고

- `DGBase.h`의 `fetchNode` 함수에 버그가 있을 수 있음: `assert(theT == nullptr && "theT is nullptr\n");`는 항상 실패해야 함
- 이는 디버그 빌드에서만 활성화되는 assert일 수 있음
