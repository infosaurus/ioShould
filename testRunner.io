Object passedCount := 0
Object failedCount := 0

Object suite := method(
  codeUnderTest := call message argAt(0)
  call sender doMessage(codeUnderTest)
  printSuiteResults(passedCount, failedCount)
)

Object test := method(testName,
  exception := try(
    printTestHeader(testName)
    codeUnderTest := call message argAt(1)
    call sender doMessage(codeUnderTest)
    passedCount = passedCount + 1
    printSuccess
  )
  exception catch(Exception,
    failedCount = failedCount + 1
    printFailure(exception)
  )
)

printTestHeader := method(testName,
  "" println
  "Test : \"#{testName}\"" interpolate println
  "------------------" println
)

printSuccess := method(
  "OK, passed." println
  "" println
)

printFailure := method(exception,
  "FAILED : #{exception type}" interpolate println
  exception coroutine backTraceString println
)

printSuiteResults := method(passedCount, failedCount,
  "" println
  "Tests : #{passedCount} passed, #{failedCount} failed." interpolate println
)
