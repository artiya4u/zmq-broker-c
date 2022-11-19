cmake_minimum_required(VERSION 3.23)
project(zmq_broker_c)

set(CMAKE_CXX_STANDARD 14)


add_executable(zmq_broker_c main.cpp)

find_package(cppzmq)
target_link_libraries(zmq_broker_c cppzmq)
