cmake_minimum_required(VERSION 3.16)
project(Server LANGUAGES CXX)

add_executable(run 
    src/main.cpp
)

set_target_properties(run PROPERTIES
    CXX_STANDARD 17
    CXX_STANDARD_REQUIRED ON
)

target_include_directories(run PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/include
)

add_subdirectory(external/core)

# platform-specific linking
if(WIN32)
    target_link_libraries(run PRIVATE core ws2_32)
    target_compile_definitions(run PRIVATE 
        ASIO_STANDALONE
        _WIN32_WINNT=0x0601 
    )
elseif(UNIX)
    target_link_libraries(run PRIVATE core pthread)
    target_compile_definitions(run PRIVATE ASIO_STANDALONE)
endif()
