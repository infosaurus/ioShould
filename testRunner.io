doFile("testSuite.io")
doFile("testOutput.io")

Object suite := method(
  self currentTestOutput := ConsoleTestOutput clone
  testSuiteCode := call message argAt(0)
  callingContext := call sender
  self currentTestSuite := TestSuite clone init(testSuiteCode, callingContext)
  self currentTestSuite run
self currentTestOutput outputSuiteResults(self currentTestSuite passedCount, self currentTestSuite failedCount)
)

Object test := method(testName,
  codeUnderTest := call message argAt(1)
  callingContext := call sender
  testCase := TestCase clone init(self currentTestSuite, testName, codeUnderTest, callingContext)
self currentTestOutput outputTestHeader(testCase name)
  exception := testCase run
  if(exception == nil) then (
    self currentTestOutput outputSuccess
  ) else (
  self currentTestOutput outputFailure(exception)
  )
)
