doFile("should.io")

ShouldFrameworkBootstrapException := Exception clone

legit := method(
  // this doesn't raise an exception
)
thrown := false
exception := try(
  block(legit) shouldThrow(Exception)
)
exception catch(DidntThrowException,
  thrown = true
)

if(thrown == true) then("DidntThrowException was thrown, everything OK" println) else(ShouldFrameworkBootstrapException raise("Fail, DidntThrowException should have been thrown !"))
