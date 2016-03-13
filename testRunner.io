Object test := method(testName,
  exception := try(
  codeUnderTest := call message argAt(1)
  call sender doMessage(codeUnderTest)
    "\"#{testName}\"" interpolate println
    "---- OK, passed." println
  )
  exception catch(Exception,
    "Test \"#{testName}\" failed : #{exception}" interpolate println
    exception coroutine backTraceString println
  )
)
