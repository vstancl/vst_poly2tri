
# Locate the glfw library
# This module defines the following variables:
# GLFW_LIBRARY, the name of the library;
# GLFW_INCLUDE_DIR, where to find glfw include files.
# GLFW_FOUND, true if both the GLFW_LIBRARY and GLFW_INCLUDE_DIR have been found.
#
# To help locate the library and include file, you could define an environment variable called
# GLFW_ROOT which points to the root of the glfw library installation. This is pretty useful
# on a Windows platform.
#
#
# Usage example to compile an "executable" target to the glfw library:
#
# FIND_PACKAGE (glfw REQUIRED)
# INCLUDE_DIRECTORIES (${GLFW_INCLUDE_DIR})
# ADD_EXECUTABLE (executable ${EXECUTABLE_SRCS})
# TARGET_LINK_LIBRARIES (executable ${GLFW_LIBRARY})
#
# TODO:
# Allow the user to select to link to a shared library or to a static library.

IF (GLFW_INCLUDE_DIR)
  # Already in cache, be silent
  SET(GLFW_FIND_QUIETLY TRUE)
ENDIF (GLFW_INCLUDE_DIR)

if( WIN32 )
   if( MSVC80 )
       set( COMPILER_PATH "C:/Program\ Files/Microsoft\ Visual\ Studio\ 8/VC" )
   endif( MSVC80 )
   if( MSVC71 )
       set( COMPILER_PATH "C:/Program\ Files/Microsoft\ Visual\ Studio\ .NET\ 2003/Vc7" )
   endif( MSVC71 )
   FIND_PATH( GLFW_INCLUDE_DIR gl/GLFW.h gl/wGLFW.h
              PATHS
              "${TRIDIM_3RDPARTY_DIR}/include"
              ${COMPILER_PATH}/PlatformSDK/Include
              )
   SET( GLFW_NAMES GLFW32 )
   FIND_LIBRARY( GLFW_LIBRARY
                 NAMES ${GLFW_NAMES}
                 PATHS
                 "${TRIDIM_3RDPARTY_DIR}/lib"
                 ${COMPILER_PATH}/PlatformSDK/Lib
                 )
else( WIN32 )
   FIND_PATH( GLFW_INCLUDE_DIR GLFW.h wGLFW.h
              PATHS
              "${TRIDIM_3RDPARTY_DIR}/include"
              /usr/local/include
              /usr/include
              /opt/local/include
              /opt/include
              PATH_SUFFIXES gl/ GL/
              )
   SET( GLFW_NAMES GLFW GLFW )
   FIND_LIBRARY( GLFW_LIBRARY
                 NAMES ${GLFW_NAMES}
                 PATHS
                 "${TRIDIM_3RDPARTY_DIR}/lib"
                 /usr/lib
                 /usr/local/lib
                 /opt/lib
                 /opt/local/lib
                 )
endif( WIN32 )

GET_FILENAME_COMPONENT( GLFW_LIBRARY_DIR ${GLFW_LIBRARY} PATH )

IF (GLFW_INCLUDE_DIR AND GLFW_LIBRARY)
   SET(GLFW_FOUND TRUE)
    SET( GLFW_LIBRARY_DIR ${GLFW_LIBRARY} )
ELSE (GLFW_INCLUDE_DIR AND GLFW_LIBRARY)
   SET( GLFW_FOUND FALSE )
   SET( GLFW_LIBRARY_DIR )
ENDIF (GLFW_INCLUDE_DIR AND GLFW_LIBRARY)

MARK_AS_ADVANCED(
  GLFW_LIBRARY
  GLFW_INCLUDE_DIR
)  


