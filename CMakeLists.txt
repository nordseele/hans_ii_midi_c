cmake_minimum_required(VERSION 3.13.4)

project(hans_ii_midi)

add_executable(${PROJECT_NAME} main.cpp)

add_subdirectory(rtmidi)
add_subdirectory(pigpio)

target_link_libraries(${PROJECT_NAME} PRIVATE rtmidi)
target_link_libraries(${PROJECT_NAME} PRIVATE pigpio)

install(TARGETS hans_ii_midi DESTINATION bin)
