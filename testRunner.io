doFile("testSuite.io")

Object suite := method(
  testSuiteCode := call message argAt(0)
  callingContext := call sender
  self currentTestSuite := TestSuite clone init(testSuiteCode, callingContext)
  self currentTestSuite run
  printSuiteResults(self currentTestSuite passedCount, self currentTestSuite failedCount)
)

Object test := method(testName,
  codeUnderTest := call message argAt(1)
  callingContext := call sender
  testCase := TestCase clone init(self currentTestSuite, testName, codeUnderTest, callingContext)
  printTestHeader(testCase name)
  exception := testCase run
  if(exception == nil) then (
    printSuccess
  ) else (
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
