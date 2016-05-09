Object passedCount := 0
Object failedCount := 0

Object suite := method(
  codeUnderTest := call message argAt(0)
  call sender doMessage(codeUnderTest)
  "" println
  "Tests : #{passedCount} passed, #{failedCount} failed." interpolate println
)

Object test := method(testName,
  exception := try(
    "" println
    "Test : \"#{testName}\"" interpolate println
    "------------------" println
    codeUnderTest := call message argAt(1)
    call sender doMessage(codeUnderTest)
    passedCount = passedCount + 1
    "OK, passed." println
    "" println
  )
  exception catch(Exception,
    failedCount = failedCount + 1
    "FAILED : #{exception type}" interpolate println
    exception error println
    exception coroutine backTraceString println
  )
)
