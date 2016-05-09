doFile("should.io")
doFile("testRunner.io")

ShouldFrameworkBootstrapException := Exception clone

test("shouldRaise raises an exception when no exception was raised",
  legit := method(
    # this doesn't raise an exception
  )
  raised := false
  exception := try(
    block(legit) shouldRaise(Exception)
  )
  exception catch(DidntRaiseException,
    raised = true
  )

  if(raised != true, ShouldFrameworkBootstrapException raise("Fail, DidntRaise Exception should have been raised !"))
)

test("shouldRaise doesn't raise an exception if the exception was raised",
  SpecificException := Exception clone
  bugged := method(
    SpecificException raise
  )
  raised := false
  exception := try(
    block(bugged) shouldRaise(SpecificException)
  )
  exception catch(DidntRaiseException,
    raised = true
  )

  if(raised != false, ShouldFrameworkBootstrapException raise("Fail, DidntRaise Exception shouldn't have been raised !"))
)

test("shouldRaise raises an exception when the exception message doesn't match",
  SpecificException := Exception clone
  exceptionMessage := "some message"
  bugged := method(
    SpecificException raise(exceptionMessage)
  )
  raised := false
  exception := try(
    block(bugged) shouldRaise(SpecificException, "another message")
  )
  exception catch(DidntRaiseException,
    raised = true
  )

  if(raised != true, ShouldFrameworkBootstrapException raise("Fail, DidntRaise Exception should have been raised because the message didn't match !"))
)

test("shouldRaise doesn't raise an exception when the exception message matches",
  SpecificException := Exception clone
  exceptionMessage := "some message"
  bugged := method(
    SpecificException raise(exceptionMessage)
  )
  raised := false
  exception := try(
  block(bugged) shouldRaise(SpecificException, exceptionMessage)
  )
  exception catch(DidntRaiseException,
    raised = true
  )

  if(raised != false, ShouldFrameworkBootstrapException raise("Fail, DidntRaise Exception shouldn't have been raised because the message matched !"))
)
