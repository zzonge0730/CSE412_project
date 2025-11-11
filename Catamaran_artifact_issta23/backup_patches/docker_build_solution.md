# Docker 빌드 환경 해결 방법

## 문제 상황

MoveC 바이너리가 호스트에서 빌드되어 Docker 컨테이너(Ubuntu 20.04, GLIBC 2.31)에서 실행 불가:
```
movec/bin/movec: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found
movec/bin/movec: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found
movec/bin/movec: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found
movec/bin/movec: /lib/x86_64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.29' not found
```

## 해결 방법 옵션

### 옵션 1: 호스트에서 MoveC 실행하여 IR 파일 생성 (권장)

MoveC는 소스 코드 변환 도구이므로, 호스트에서 실행하여 IR 파일을 생성하고, 그 IR 파일을 Docker 컨테이너에서 사용:

1. **호스트에서 MoveC 실행**:
   ```bash
   # 호스트에서
   cd /home/rkddngpr/Catamaran_artifact_issta23
   ./movec/bin/movec --check-memsafe -c ./examples/2mm.c -o MoveC-2mm.c
   ./build-catamaran-3.4.0.host-build/bin/clang -S -emit-llvm MoveC-2mm.c -o MoveC-2mm.ll
   ./build-catamaran-3.4.0.host-build/bin/llvm-as MoveC-2mm.ll -o MoveC-movec.bc
   ```

2. **Docker 컨테이너에서 IR 파일 사용**:
   ```bash
   # Docker 컨테이너 안에서
   docker compose run --rm dev bash -c "cd /workspace && \
     ./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so \
     -PDGAnalysis < MoveC-movec.bc -o /dev/null"
   ```

**장점**: 
- MoveC 빌드 불필요
- 기존 워크플로우 유지
- IR 파일은 플랫폼 독립적

**단점**: 
- 호스트와 Docker 컨테이너 간 파일 공유 필요 (이미 마운트되어 있음)

### 옵션 2: MoveC 소스 코드 빌드

MoveC GitHub 저장소에서 소스 코드를 찾아 Docker 컨테이너 안에서 빌드:

1. MoveC 소스 코드 위치 확인 필요
2. 빌드 방법 문서화 필요
3. 시간 소요 예상

### 옵션 3: 기존 IR 파일 사용

이미 생성된 IR 파일(`MoveC-movec.bc`)을 사용하여 테스트 진행:

**장점**: 
- 즉시 사용 가능
- MoveC 실행 불필요

**단점**: 
- 새로운 테스트 케이스 추가 시 MoveC 필요

## 권장 사항

**옵션 3을 권장합니다 (가장 안정적).** 

현재 상황:
- 이미 생성된 IR 파일(`MoveC-movec.bc`)이 있음
- 이 IR 파일은 원본 MoveC 구조를 가지고 있어 테스트에 충분함
- Docker 컨테이너 내에서 완전히 독립적으로 동작
- 호스트 환경에 의존하지 않음

**워크플로우:**
1. 기존 IR 파일 사용하여 Docker 컨테이너 안에서 테스트 진행
2. 새로운 테스트 케이스가 필요한 경우에만 옵션 1 사용 (호스트에서 MoveC 실행)

이렇게 하면:
- ✅ Docker 컨테이너 내에서 완전히 독립적
- ✅ 호스트 환경 변경에 영향 없음
- ✅ 가장 안정적이고 간단한 워크플로우
- ✅ 기존 IR 파일로 충분한 테스트 가능
