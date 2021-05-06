cmake_minimum_required(VERSION 3.11)


add_executable(rofi-gazebosim-attacher attacher.cpp)
target_link_libraries(rofi-gazebosim-attacher rofisimMessages ${GAZEBO_LIBRARIES} ${Boost_LIBRARIES})

add_executable(rofi-gazebosim-listener listener.cpp)
target_link_libraries(rofi-gazebosim-listener rofisimMessages ${GAZEBO_LIBRARIES} ${Boost_LIBRARIES})

add_executable(rofi-gazebosim-ping ping.cpp)
target_link_libraries(rofi-gazebosim-ping rofiHal)

add_executable(rofi-gazebosim-commandLine commandLine.cpp)
target_link_libraries(rofi-gazebosim-commandLine rofiHal)

add_executable(rofi-gazebosim-roficomCmd roficomCmd.cpp)
target_link_libraries(rofi-gazebosim-roficomCmd rofisimMessages ${GAZEBO_LIBRARIES} ${Boost_LIBRARIES})


add_subdirectory(worldCreator)
