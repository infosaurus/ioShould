Object test := method(testName,
  exception := try(
    "" println
    "Test : \"#{testName}\"" interpolate println
    "------------------" println
    codeUnderTest := call message argAt(1)
    call sender doMessage(codeUnderTest)
    "OK, passed." println
    "" println
  )
  exception catch(Exception,
    "FAILED : #{exception type}" interpolate println
    exception error println
    exception coroutine backTraceString println
  )
)
