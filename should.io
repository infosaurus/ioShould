DidntRaiseException := Exception clone
WasNotEqualException := Exception clone

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
