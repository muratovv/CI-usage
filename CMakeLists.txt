cmake_minimum_required(VERSION 3.10)
project(CI_usage CXX)

set(CMAKE_C_STANDARD 11)

set(${PROJECT_NAME}_SRC src/main.cpp)

add_executable(${PROJECT_NAME} ${${PROJECT_NAME}_SRC})
