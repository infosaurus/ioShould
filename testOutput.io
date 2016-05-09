ConsoleTestOutput := Object clone

ConsoleTestOutput outputTestHeader := method(testName,
  "" println
  "Test : \"#{testName}\"" interpolate println
  "------------------" println
)

ConsoleTestOutput outputSuccess := method(
  "OK, passed." println
  "" println
)

ConsoleTestOutput outputFailure := method(exception,
  "FAILED : #{exception type}" interpolate println
  exception coroutine backTraceString println
)

ConsoleTestOutput outputSuiteResults := method(passedCount, failedCount,
  "" println
  "Tests : #{passedCount} passed, #{failedCount} failed." interpolate println
)
