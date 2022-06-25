cmake_minimum_required(VERSION 3.19)

unset(ARGN)
foreach(i RANGE ${CMAKE_ARGC})
    if(NOT DEFINED ARGN)
        if (CMAKE_ARGV${i} STREQUAL --)
            set(ARGN [[]])
        endif()
    elseif(CMAKE_ARGV${i} STREQUAL |)
        list(APPEND ARGN COMMAND)
    else()
        list(APPEND ARGN ${CMAKE_ARGV${i}})
    endif()
endforeach()

macro(exec)
    execute_process(WORKING_DIRECTORY ${CMAKE_CURRENT_LIST_DIR} COMMAND_ERROR_IS_FATAL ANY COMMAND ${ARGN})
endmacro()

macro(cmake)
    exec(${CMAKE_COMMAND} ${ARGN})
endmacro()

macro(ctest)
    exec(${CMAKE_CTEST_COMMAND} ${ARGN})
endmacro()

list(GET ARGN 0 preset)
set(dir ${CMAKE_CURRENT_LIST_DIR}/cmake-build-${preset})

file(REMOVE_RECURSE ${dir}/CMakeCache.txt ${dir}/CMakeFiles)
cmake(--preset ${preset})
cmake(--build ${dir} --config RelWithDebInfo --verbose)
ctest(--test-dir ${dir} --build-config RelWithDebInfo --extra-verbose)
