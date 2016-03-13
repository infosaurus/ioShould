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

  if(raised != true)(ShouldFrameworkBootstrapException raise("Fail, DidntRaise Exception should have been raised !"))
)
