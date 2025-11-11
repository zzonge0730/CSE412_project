# Docker 빌드 환경 - 안정적인 워크플로우

## 최종 결정: 옵션 3 (기존 IR 파일 사용)

**이유**: 가장 안정적이고 Docker 컨테이너 내에서 완전히 독립적

## 현재 상태

✅ **완료된 작업:**
- Catamaran: Docker 컨테이너 안에서 재빌드 완료
- SoftBoundCETS: Docker 컨테이너 안에서 빌드 가능
- 기존 IR 파일: `MoveC-movec.bc` 존재 (97KB)

✅ **사용 가능한 IR 파일:**
- `MoveC-movec.bc`: MoveC가 생성한 원본 구조를 가진 IR 파일
- `MoveC-2mm.ll`: LLVM IR 텍스트 형식 (670KB)

## 워크플로우

### 기본 워크플로우 (Docker 컨테이너 안에서)

```bash
# 1. Docker 컨테이너 진입
docker compose run --rm dev

# 2. 컨테이너 안에서 작업
cd /workspace

# 3. 기존 IR 파일로 MoveC γ 테스트
./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -PDGAnalysis < MoveC-movec.bc -o /dev/null

# 4. 또는 전체 MoveC γ 파이프라인
./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -movec -PDGAnalysis -catamaran-pdg-reaching-analysis -LoopsMovec \
  < MoveC-movec.bc -o CM-MoveC-2mm.bc
```

### 새로운 테스트 케이스가 필요한 경우

새로운 C 파일을 테스트해야 하는 경우에만 호스트에서 MoveC 실행:

```bash
# 호스트에서
cd /home/rkddngpr/Catamaran_artifact_issta23
./movec/bin/movec --check-memsafe -c ./examples/new_test.c -o MoveC-new_test.c

# VLA 패치 적용 (필요한 경우)
# ... MoveC-new_test.c 수정 ...

# IR 파일 생성
./build-catamaran-3.4.0.host-build/bin/clang -S -emit-llvm MoveC-new_test.c -o MoveC-new_test.ll
./build-catamaran-3.4.0.host-build/bin/llvm-as MoveC-new_test.ll -o MoveC-new_test.bc

# Docker 컨테이너에서 사용
docker compose run --rm dev bash -c "cd /workspace && \
  ./build-catamaran-3.4.0/bin/opt -load ./build-catamaran-3.4.0/lib/libCMPass.so \
  -PDGAnalysis < MoveC-new_test.bc -o /dev/null"
```

## 장점

✅ **완전히 독립적**: Docker 컨테이너 내에서 모든 작업 가능
✅ **안정적**: 호스트 환경 변경에 영향 없음
✅ **간단함**: 복잡한 빌드 과정 불필요
✅ **재현 가능**: 동일한 IR 파일로 항상 동일한 결과

## 주의사항

- 기존 IR 파일(`MoveC-movec.bc`)은 원본 MoveC 구조를 가지고 있어 테스트에 충분함
- 새로운 테스트 케이스가 필요한 경우에만 호스트에서 MoveC 실행 필요
- IR 파일은 LLVM bitcode 형식으로 플랫폼 독립적이므로 호스트와 컨테이너 간 공유 가능
