DidntRaiseException := Exception clone

Block shouldRaise := method(exceptionType,
exception := try(self call)
  raised := false
  exception catch(exceptionType,
    raised = true
  )
  if(raised == false, DidntRaiseException raise(" wasn't raised"))
)
