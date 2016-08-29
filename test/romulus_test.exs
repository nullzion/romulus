defmodule RomulusTest do
  use ExUnit.Case
  doctest Romulus

  test "should return empty string" do
    assert Romulus.encode(0) == ""
  end

  test "should return I" do
    assert Romulus.encode(1) == "I"
  end

  test "should return III" do
    assert Romulus.encode(3) == "III"
  end

  test "should return IV" do
    assert Romulus.encode(4) == "IV"
  end

  test "should return C" do
    assert Romulus.encode(100) == "C"
  end

  test "should return MDCCCLXXXVIII" do
    assert Romulus.encode(1888) == "MDCCCLXXXVIII"
  end

  test "should return MCMLXXXVIII" do
    assert Romulus.encode(1988) == "MCMLXXXVIII"
  end

  test "should return MMMMCMXCIX" do
    assert Romulus.encode(4999) == "MMMMCMXCIX"
  end

  test "should fail if number larger than 4999" do
    assert_raise ArgumentError, fn -> Romulus.encode(5000) end
  end
end
