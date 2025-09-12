find_package(BISON REQUIRED)
find_package(FLEX REQUIRED)

execute_process(COMMAND  ${FLEX_EXECUTABLE} -V
OUTPUT_VARIABLE  FLEX_VERSION_INFO)
string(FIND "${FLEX_VERSION_INFO}" "win_flex" DD)
if(DD EQUAL -1)
	set(IS_WIN_FLEX 0)
else()
	set(IS_WIN_FLEX 1)
endif()

router_directories()