MACRO(SUBDIRLIST result curdir)
  FILE(GLOB children RELATIVE ${curdir} ${curdir}/*)
  SET(dirlist "")
  FOREACH(child ${children})
    IF(IS_DIRECTORY ${curdir}/${child})
      LIST(APPEND dirlist ${child})
    ENDIF()
  ENDFOREACH()
  SET(${result} ${dirlist})
ENDMACRO()

function(subdirslist)
  # Declare the argument keywords
  set(options)                             # boolean flags
  set(oneValueArgs RESULT CURDIR)          # Expected named args
  set(multiValueArgs EXCLUDE)              # list args

  cmake_parse_arguments(SUBDIRLIST "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGV})

  if(NOT SUBDIRLIST_RESULT OR NOT SUBDIRLIST_CURDIR)
    message(FATAL_ERROR "subdirlist requires RESULT and CURDIR arguments")
  endif()

  file(GLOB children RELATIVE "${SUBDIRLIST_CURDIR}" "${SUBDIRLIST_CURDIR}/*")
  set(dirlist "")
  foreach(child ${children})
    if(IS_DIRECTORY "${SUBDIRLIST_CURDIR}/${child}")
      LIST(FIND SUBDIRLIST_EXCLUDE "${child}" index)
      IF(index EQUAL -1)
        list(APPEND dirlist "${child}")
      ENDIF()
    endif()
  endforeach()

  set(${SUBDIRLIST_RESULT} "${dirlist}" PARENT_SCOPE)
endfunction()
