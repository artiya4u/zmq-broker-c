cmake_minimum_required(VERSION 3.18)
project(zmq_broker_c)

set(CMAKE_CXX_STANDARD 14)


add_executable(zmq_broker_c main.cpp)


if (${CMAKE_SYSTEM_NAME} MATCHES "Darwin")
    find_package(cppzmq)
    target_link_libraries(zmq_broker_c cppzmq)
else ()
    find_package(zmq)
    target_link_libraries(zmq_broker_c zmq)
endif ()