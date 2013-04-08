include_directories(${poly2tr_source_dir}/poly2tri)
include_directories(${poly2tr_binary_dir}/poly2tri)

set(TESTBED_SOURCES main.cc)

# Find and test glfw library
FIND_PACKAGE (glfw REQUIRED)
IF( GLFW_FOUND )
  INCLUDE_DIRECTORIES( ${GLFW_INCLUDE_DIR} )
  SET( GLFW_LIBRARY ${GLFW_LIBRARY_DIR} CACHE STRING "GLFW library." )
ELSE( GLFW_FOUND )
  MESSAGE( FATAL_ERROR "GLFW library was not found! Please, set the cache entry GLFW_ROOT_DIR!"  )
ENDIF( GLFW_FOUND )

# Find and test glu32 library
FIND_PACKAGE (glu REQUIRED)
IF( OPENGL_GLU_FOUND )
  INCLUDE_DIRECTORIES( ${GLU_INCLUDE_PATH} )
#  SET( GLU_LIBRARY ${GLU_LIBRARY} CACHE STRING "GLU library." )
ELSE( OPENGL_GLU_FOUND )
  MESSAGE( FATAL_ERROR "GLU library was not found! Please, set the cache entry GLFW_ROOT_DIR!"  )
ENDIF( OPENGL_GLU_FOUND )

add_executable(testbed ${TESTBED_SOURCES})
include_directories(${GLFW_INCLUDE_DIR})
target_link_libraries(testbed poly2tri ${GLFW_LIBRARY} ${GLU_LIBRARY})
