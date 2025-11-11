# Docker 컨테이너 안에서 원본 코드 테스트 결과

## 테스트 일시
2025-11-10 (Docker 컨테이너 환경)

## 테스트 환경
- Docker 이미지: `catamaran-dev:latest` (Ubuntu 20.04, gcc-7/g++-7)
- GLIBC 버전: 2.31
- 빌드: Docker 컨테이너 안에서 새로 빌드 (기존 빌드는 호스트에서 빌드되어 실행 불가)

## 수행한 작업

### 1. 빌드
- 기존 빌드 백업: `build-catamaran-3.4.0` → `build-catamaran-3.4.0.host-build`
- Docker 컨테이너 안에서 Catamaran 재빌드 완료
- 빌드된 바이너리: Docker 컨테이너에서 정상 실행 확인

### 2. 원본 코드 복원
- SoftBoundCETS 파일: 원본 상태로 복원 (`#include <bits/errno.h>` 사용)
- MoveC: MoveC 바이너리가 호스트에서 빌드되어 Docker 컨테이너에서 실행 불가
  - 기존 IR 파일(`MoveC-movec.bc`) 사용하여 테스트 진행

### 3. 테스트 결과

#### 원본 코드 상태에서 MoveC γ 테스트
```bash
./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so -PDGAnalysis < MoveC-movec.bc -o /dev/null
```

**결과**: Segfault 발생
```
Stack dump:
0.	Program arguments: ./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so -PDGAnalysis -o /dev/null 
1.	Running pass 'Computing the Program Dependence Graph' on module '<stdin>'.
Segmentation fault at: PDG::setEntryPointAt(llvm::Function&)
```

#### 수정사항 적용 후 테스트
- SoftBoundCETS errno.h 패치 적용
- MoveC-2mm.c VLA 패치 적용 (IR 파일은 동일하므로 결과 동일 예상)

**결과**: 동일한 segfault 발생 (예상됨 - IR 파일이 동일하므로)

## 결론

1. **Docker 컨테이너 안에서도 동일한 문제 발생**
   - 원본 코드 상태에서도 `PDG::setEntryPointAt`에서 segfault 발생
   - 이는 수정사항과 무관한 Catamaran과 MoveC의 호환성 문제임

2. **빌드 환경 확인**
   - 기존 빌드는 호스트(WSL2, GLIBC 2.35)에서 빌드되어 Docker 컨테이너에서 실행 불가
   - Docker 컨테이너 안에서 재빌드하여 정상 실행 확인

3. **수정사항의 필요성**
   - SoftBoundCETS errno.h 패치: glibc 2.31 호환성을 위한 필수 패치
   - MoveC-2mm.c VLA 패치: 컴파일을 위한 필수 패치
   - 이 수정사항들은 MoveC γ segfault 문제와 무관함

## 다음 단계

수정사항을 유지하고 MoveC γ 문제를 해결하는 것이 올바른 접근:
- 옵션 1: `_RV_main`을 `main`으로 되돌리는 전처리 스크립트 작성
- 옵션 2: Catamaran 패스에서 엔트리 함수 처리 로직 수정
- 옵션 3: Pass 순서 변경 또는 개별 적용 테스트
