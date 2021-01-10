cmake_minimum_required(VERSION 3.13.4)

project(hans_ii_midi)

add_executable(${PROJECT_NAME} main.cpp bsc.cpp)

set(CMAKE_CXX_FLAGS "-Wall -D__LINUX_ALSA__ -lpthread"  ${CMAKE_CXX_FLAGS})

add_subdirectory(rtmidi pigpio)

target_include_directories(${PROJECT_NAME} PRIVATE rtmidi pigpio)

target_link_directories(${PROJECT_NAME} PRIVATE rtmidi pigpio)

target_link_libraries(${PROJECT_NAME} rtmidi pigpio)

