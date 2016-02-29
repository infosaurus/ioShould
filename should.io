DidntThrowException := Exception clone

Block shouldThrow := method(exceptionType,
  DidntThrowException raise(" wasn't thrown")
  # blockUnderTest := call target
  # exception := try(
  #   doMessage(blockUnderTest)
  # )
  # exception catch(Exception,
  # )
  #sendd println
)
