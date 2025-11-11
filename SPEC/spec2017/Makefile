# You can use one of the two following ways to init DIRS.
# 1. Search for all sub-directories.
DIRS := $(sort $(shell ls -d */))
# 2. Designate a set of sub-directories.
# DIRS := 519.lbm_r/ 525.x264_r/ 538.imagick_r/ 544.nab_r/ 557.xz_r/

BUILDS   := $(patsubst %/, %/build,   $(DIRS))
TESTS    := $(patsubst %/, %/test,    $(DIRS))
REFRATES := $(patsubst %/, %/refrate, $(DIRS))
CLEANS   := $(patsubst %/, %/clean,   $(DIRS))

.PHONE: build $(BUILDS) test $(TESTS) refrate $(REFRATES) clean $(CLEANS)

build: $(BUILDS)

$(BUILDS): %/build: %/src
	@$(MAKE) -C $<

test: $(TESTS)

$(TESTS): %/test: %/src %/build
	@echo "Running" $(patsubst %/test, %, $@) "on test ..."
	@if [ -z "$${BENCHMARK_RUN_TIMES}" ]; then \
	     export BENCHMARK_COUNT_DOWN=1; \
	 else \
	     export BENCHMARK_COUNT_DOWN="$${BENCHMARK_RUN_TIMES}"; \
	     echo "==== Run $${BENCHMARK_RUN_TIMES} times ===="; \
	 fi; \
	 cd $<; \
	 while [ $${BENCHMARK_COUNT_DOWN} -ge 1 ]; do \
	     ./run_test.sh diff; \
	     export BENCHMARK_COUNT_DOWN=`expr $${BENCHMARK_COUNT_DOWN} - 1`; \
	 done;

refrate: $(REFRATES)

$(REFRATES): %/refrate: %/src %/build
	@echo "Running" $(patsubst %/refrate, %, $@) "on refrate ..."
	@if [ -z "$${BENCHMARK_RUN_TIMES}" ]; then \
	     export BENCHMARK_COUNT_DOWN=1; \
	 else \
	     export BENCHMARK_COUNT_DOWN="$${BENCHMARK_RUN_TIMES}"; \
	     echo "==== Run $${BENCHMARK_RUN_TIMES} times ===="; \
	 fi; \
	 cd $<; \
	 while [ $${BENCHMARK_COUNT_DOWN} -ge 1 ]; do \
	     ./run_refrate.sh diff; \
	     export BENCHMARK_COUNT_DOWN=`expr $${BENCHMARK_COUNT_DOWN} - 1`; \
	 done;

clean: $(CLEANS)

$(CLEANS): %/clean: %/src
	@$(MAKE) -C $< clean

-include Makefile.inc.movec-memsafe

-include Makefile.inc.addresssanitizer

-include Makefile.inc.softboundcets

