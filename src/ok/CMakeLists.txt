cmake_path(GET CMAKE_CURRENT_LIST_DIR STEM PROJ)
flex_target(${PROJ}_SCANNER ok.l ${CMAKE_CURRENT_BINARY_DIR}/${PROJ}.lex.cpp
DEFINES_FILE "${CMAKE_CURRENT_BINARY_DIR}/${PROJ}.lex.h"
OPTIONS "--prefix=${PROJ}")
bison_target(${PROJ}_PARSER ok.y ${CMAKE_CURRENT_BINARY_DIR}/${PROJ}.yacc.cpp
DEFINES_FILE "${CMAKE_CURRENT_BINARY_DIR}/${PROJ}.yacc.h"
OPTIONS "")
add_flex_bison_dependency(${PROJ}_SCANNER ${PROJ}_PARSER)
cmake_path(GET FLEX_${PROJ}_SCANNER_OUTPUT_HEADER FILENAME ${PROJ}_SCANNER_HEADER)
cmake_path(GET BISON_${PROJ}_PARSER_OUTPUT_HEADER FILENAME ${PROJ}_PARSER_HEADER)
configure_file(config.h.in config.h)
configure_file(ok.h.in ${PROJ}.h)
configure_file(ok.yy.h.in yy.h)
add_executable(${PROJ} yacc.cpp
${FLEX_${PROJ}_SCANNER_OUTPUTS}
${BISON_${PROJ}_PARSER_OUTPUTS})
target_include_directories(${PROJ} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})