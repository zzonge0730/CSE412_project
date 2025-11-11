include_directories(
    ../../../include
)


add_llvm_library( CMPass SHARED
    AccumulatorOpInfo.cpp
    BitMatrix.cpp
    DataFlowAnalysis.cpp
    DataFlowEngine.cpp
    DataFlowResult.cpp
    DOALLTask.cpp
    DominatorSummary.cpp
    EnvBuilder.cpp
    InductionVariables.cpp
    InvariantManager.cpp
    IVStepperUtility.cpp
    LoopCarriedDependencies.cpp
    LoopDependenceInfo.cpp
    LoopEnvironment.cpp
    LoopFreeTask.cpp
    LoopGoverningIVAttribution.cpp
    LoopIterationDomainSpaceAnalysis.cpp
    LoopStructure.cpp
    LoopSummary.cpp
    LoopVariables.cpp
    MemoryCloningAnalysis.cpp
    PDG.cpp
    PDGAnalysis.cpp
    ScalarEvolutionDelinearization.cpp
    ScalarEvolutionReferencer.cpp
    SCC.cpp
    SCCAttrs.cpp
    SCCDAG.cpp
    SCCDAGAttrs.cpp
    StayConnectedNestedLoopForest.cpp
    TransferForAsan.cpp
    Utils.cpp
)

add_dependencies(CMPass LLVMInstrumentation)