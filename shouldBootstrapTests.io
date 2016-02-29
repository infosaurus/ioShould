doFile("should.io")

ShouldFrameworkBootstrapException := Exception clone

legit := method(
  // this doesn't raise an exception
)
raised := false
exception := try(
block(legit) shouldRaise(Exception)
)
exception catch(DidntRaiseException,
  raised = true
)

if(raised == true) then("DidntRaiseException was raised, everything OK" println) else(ShouldFrameworkBootstrapException raise("Fail, DidntRaise Exception should have been raised !"))
