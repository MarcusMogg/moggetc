#include "hello.h"

#include "catch2/catch_test_macros.hpp"

using namespace std::string_view_literals;

TEST_CASE("1", "2") {
  SECTION("hello") { CHECK(Hello() == "hello"sv); }
}