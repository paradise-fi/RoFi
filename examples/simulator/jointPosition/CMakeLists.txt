cmake_minimum_required(VERSION 3.11)

add_executable(jointPosition jointPosition.cpp)
target_link_libraries(jointPosition rofiHal)
