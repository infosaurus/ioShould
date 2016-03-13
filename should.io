DidntRaiseException := Exception clone

Block shouldRaise := method(exceptionType,
  DidntRaiseException raise(" wasn't raised")
)
