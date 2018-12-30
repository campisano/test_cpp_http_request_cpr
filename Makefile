# CUSTOM output executable and lib files
DEFAULT_TARGET =		debug
TARGET_EXEC =			test_http_req
TARGET_LIB =
HEADER_EXT =			.hpp
SOURCE_EXT =			.cpp

# CUSTOM paths
INC_DIRS =			inc
INC_EXT_DIRS =			ext/cpr/include
FORMAT_INC_DIRS =		inc
SRC_DIRS =			src/thr
TEST_SRC_DIRS =			src/test
FORMAT_SRC_DIRS =		src
MAIN_SRC =			src/main.cpp
LIB_DIRS =			ext/cpr/lib
ROOT_BUILD_DIR =		bin

# CUSTOM libs for different targets
RELEASE_LIBS =			cpr curl
STATIC_LIBS =			$(RELEASE_LIBS)
LIBRARY_LIBS =			$(RELEASE_LIBS)
DEBUG_LIBS =			$(RELEASE_LIBS)
PROFILE_LIBS =			$(RELEASE_LIBS)
TEST_LIBS =			$(RELEASE_LIBS)

# finally, include the generic makefile
include ext/Makefile.inc