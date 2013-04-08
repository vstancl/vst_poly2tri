include_directories(${poly2tr_source_dir}/poly2tri)
include_directories(${poly2tr_binary_dir}/poly2tri)

set(TESTBED_SOURCES main.cc)

FIND_PACKAGE (glfw REQUIRED)
INCLUDE_DIRECTORIES (${GLFW_INCLUDE_DIR})
TARGET_LINK_LIBRARIES (executable ${GLFW_LIBRARY})

add_executable(testbed TESTBED_SOURCES)
target_link_libraries(testbed poly2tri ${GLFW_LIBRARY})
