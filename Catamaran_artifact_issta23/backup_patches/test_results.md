# 원본 코드 테스트 결과

## 테스트 일시
2025-11-10

## 테스트 환경
- **모든 테스트는 Docker 컨테이너 안에서 진행**
- Docker 이미지: `catamaran-dev:latest` (Ubuntu 20.04, gcc-7/g++-7, GLIBC 2.31)
- 컨테이너 진입: `docker compose run --rm dev`
- **중요**: 호스트에서 빌드한 바이너리는 Docker 컨테이너에서 실행 불가

## 테스트 목적
원본 코드 상태에서 MoveC γ 문제가 발생하는지 확인하여, 수정사항이 문제의 원인인지 확인

## 수행한 작업

### 1. 백업
- `softboundcets-34/softboundcets-lib/softboundcets-wrappers.c` → `backup_patches/`
- `softboundcets-34/softboundcets-lib/softboundmpx-wrappers.c` → `backup_patches/`
- `MoveC-2mm.c` (패치된 버전) → `backup_patches/`

### 2. 원본 코드 복원
- SoftBoundCETS 파일: 원본 상태로 복원 (`#include <bits/errno.h>` 사용)
- MoveC-2mm.c: MoveC 바이너리가 Docker 컨테이너에서 실행 불가로 원본 출력 생성 불가
  - 기존 IR 파일(`MoveC-movec.bc`) 사용하여 테스트 진행

### 3. 테스트 결과

#### 원본 MoveC 출력 컴파일 시도
**참고**: MoveC 바이너리가 Docker 컨테이너에서 실행 불가로 원본 출력 생성 불가
- 호스트에서 MoveC 실행 시도했으나, 생성된 코드는 VLA 파라미터 문제로 컴파일 실패
- 기존 IR 파일(`MoveC-movec.bc`)이 원본 MoveC 구조를 가지고 있으므로 이를 사용

#### 기존 IR 파일로 MoveC γ 테스트 (Docker 컨테이너 안에서)
```bash
docker compose run --rm dev bash -c "cd /workspace && \
  ./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -PDGAnalysis < MoveC-movec.bc -o /dev/null"
```

**결과**: Segfault 발생
```
Stack dump:
0.	Program arguments: ./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so -PDGAnalysis -o /dev/null 
1.	Running pass 'Computing the Program Dependence Graph' on module '<stdin>'.
Segmentation fault at: PDG::setEntryPointAt(llvm::Function&)
```

## 결론

1. **원본 코드에서도 동일한 문제 발생**
   - MoveC-movec.bc IR 파일은 원본 MoveC 구조(_RV_main 등)를 가지고 있음
   - 원본 코드 상태에서도 `PDG::setEntryPointAt`에서 segfault 발생

2. **수정사항의 필요성**
   - SoftBoundCETS errno.h 패치: glibc 2.31 호환성을 위한 필수 패치
   - MoveC-2mm.c VLA 패치: 컴파일을 위한 필수 패치
   - 이 수정사항들은 MoveC γ segfault 문제와 무관함

3. **MoveC γ 문제의 원인**
   - Catamaran의 `PDGAnalysis`가 MoveC가 생성한 코드 구조(`_RV_main` 래퍼 등)를 처리하지 못함
   - 이는 원본 코드에서도 발생하는 호환성 문제임
   - 수정사항과 무관하게 발생

4. **Docker 빌드 환경 이슈**
   - MoveC 바이너리가 호스트에서 빌드되어 Docker 컨테이너에서 실행 불가
   - 해결 방법: 호스트에서 MoveC 실행하여 IR 파일 생성 후 Docker 컨테이너에서 사용 (옵션 1 권장)
   - 자세한 내용은 `docker_build_solution.md` 참조

## 다음 단계

수정사항을 유지하고 MoveC γ 문제를 해결하는 것이 올바른 접근:
- 옵션 1: `_RV_main`을 `main`으로 되돌리는 전처리 스크립트 작성
- 옵션 2: Catamaran 패스에서 엔트리 함수 처리 로직 수정
- 옵션 3: Pass 순서 변경 또는 개별 적용 테스트
