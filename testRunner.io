doFile("testSuite.io")

Object passedCount := 0
Object failedCount := 0

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
  testCase := TestCase clone init(testName, codeUnderTest, callingContext)
  printTestHeader(testCase name)
  testCase run
  if(testCase exception == nil) then (
    self currentTestSuite passedCount = self currentTestSuite passedCount + 1
    printSuccess
  ) else (
    self currentTestSuite failedCount = self currentTestSuite failedCount + 1
    printFailure(testCase exception)
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
