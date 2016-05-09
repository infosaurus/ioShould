TestSuite := Object clone
TestSuite testSuiteCode := nil
TestSuite callingContext := nil
TestSuite passedCount := 0
TestSuite failedCount := 0

TestSuite init := method(testSuiteCode, callingContext
  self testSuiteCode = testSuiteCode
  self callingContext = callingContext
  return self
)
TestSuite run := method(
  callingContext doMessage(testSuiteCode)
)
TestSuite incrementPassed := method(
  self passedCount = self passedCount + 1
)
TestSuite incrementFailed := method(
  self failedCount = self failedCount + 1
)

TestCase := Object clone
TestCase suite := nil
TestCase name := ""
TestCase codeUnderTest := nil
TestCase callingContext := nil
TestCase exception := nil

TestCase init := method(suite, testName, codeUnderTest, callingContext
  self suite := suite
  self name = testName
  self codeUnderTest = codeUnderTest
  self callingContext = callingContext
  return self
)
TestCase run := method(
  exception := try(
    callingContext doMessage(codeUnderTest)
    suite incrementPassed
  )
  exception catch(Exception,
    self exception = exception
    suite incrementFailed
  )
)
