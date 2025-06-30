include(FetchContent)

FetchContent_Declare(
  libgit2
  GIT_REPOSITORY https://github.com/libgit2/libgit2.git
  GIT_TAG        v1.7.2 # Or the latest stable release
)

FetchContent_MakeAvailable(libgit2)
