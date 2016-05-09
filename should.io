DidntRaiseException := Exception clone

Block shouldRaise := method(exceptionType, exceptionMessage,
  exception := try(self call)
  raised := false
  message := nil
  exception catch(exceptionType,
    raised = true
    message := exception error
  )
  if(raised == false, DidntRaiseException raise(" wasn't raised"))
  if (message != exceptionMessage, DidntRaiseException raise(" wasn't raised") )
)
