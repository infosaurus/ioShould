DidntRaiseException := Exception clone
NotEqualException := Exception clone
EqualException := Exception clone

Block shouldRaise := method(exceptionType, expectedMessage,
  exception := try(self call)
  raised := false
  capturedMessage := nil
  otherException := exception catch(exceptionType,
    raised = true
    capturedMessage := exception error
  )

  if(raised == false) then (
    messageToDisplay := " wasn't raised."
    if (otherException != nil) then (
      messageToDisplay := messageToDisplay .. " Another exception was raised instead - #{otherException type} \"#{otherException error}\"" interpolate
    )
  ) elseif (capturedMessage != expectedMessage) then (
    messageToDisplay := " wasn't raised with the correct message - expected \"#{expectedMessage}\" but was \"#{capturedMessage}\"." interpolate
  )
  if (raised == false or capturedMessage != expectedMessage, DidntRaiseException raise(messageToDisplay))
)

Object shouldEqual := method(expectedValue,
  if (self != expectedValue,
    NotEqualException raise("#{expectedValue} should be equal to #{self} but is not." interpolate)
  )
)

Object shouldNotEqual := method(expectedValue,
  if (self == expectedValue,
    EqualException raise("#{expectedValue} shouldn't be equal to #{self} but it is." interpolate)
  )
)
