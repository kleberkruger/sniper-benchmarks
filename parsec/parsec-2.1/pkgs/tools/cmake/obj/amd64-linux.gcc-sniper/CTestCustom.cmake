SET(CTEST_CUSTOM_WARNING_EXCEPTION
  ${CTEST_CUSTOM_WARNING_EXCEPTION}
  "xtree.[0-9]+. : warning C4702: unreachable code"
  "warning LNK4221"
  "variable .var_args[2]*. is used before its value is set"
  "jobserver unavailable"
  "warning: \\(Long double usage is reported only once for each file"
  "warning: To disable this warning use"
  "could not be inlined"
  "libcmcurl.*has no symbols"
  "not sorted slower link editing will result"
  "stl_deque.h:479"
  "Utilities.cmzlib."
  "Utilities.cmxmlrpc."
  "Source.CTest.Curl"
  "Utilities.cmcurl"
  "Source.CursesDialog.form"
  "/usr/bin/ld.*warning.*-..*directory.name.*bin.*does not exist"
  "Redeclaration of .send..... with a different storage class specifier"
  "Utilities.cmexpat."
  "is not used for resolving any symbol"
  "Clock skew detected"
  "remark\\(1209"
  "stl_deque.h:1051"
  "Parser.cxx.*warning.*2111-D.*statement is unreachable"
  "CMakeSetupManifest.xml.*manifest authoring warning.*Unrecognized Element"
  )

IF(NOT "Unix Makefiles" MATCHES "Xcode")
  SET(CTEST_CUSTOM_COVERAGE_EXCLUDE
    ${CTEST_CUSTOM_COVERAGE_EXCLUDE}
    "XCode"
    )
ENDIF (NOT "Unix Makefiles" MATCHES "Xcode")

IF(NOT "Unix Makefiles" MATCHES "KDevelop")
  SET(CTEST_CUSTOM_COVERAGE_EXCLUDE
    ${CTEST_CUSTOM_COVERAGE_EXCLUDE}
    "Kdevelop"
    )
ENDIF (NOT "Unix Makefiles" MATCHES "KDevelop")

SET(CTEST_CUSTOM_COVERAGE_EXCLUDE
  ${CTEST_CUSTOM_COVERAGE_EXCLUDE}

  # Exclude kwsys files from coverage results. They are reported
  # (with better coverage results) on kwsys dashboards...
  "/Source/(cm|kw)sys/"

  # Exclude try_compile sources from coverage results:
  "/CMakeFiles/CMakeTmp/"
  )
