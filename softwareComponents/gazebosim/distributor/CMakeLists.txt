cmake_minimum_required(VERSION 3.11)

add_library(distributorPlugin SHARED distributorPlugin.cpp)
target_link_libraries(distributorPlugin rofiPluginCommon)
