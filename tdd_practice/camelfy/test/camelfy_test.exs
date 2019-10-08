defmodule CamelfyTest do
  use ExUnit.Case

  test "an empty string returns an empty string" do
    assert Camelfy.to_camel("") == ""
  end

  test "a string of all whitespace characters returns an empty string" do
    assert Camelfy.to_camel("     -  _ ") == ""
  end

  test "a string with no separations returns the same string" do
    assert Camelfy.to_camel("string") == "string"
  end

  test "two words separated by a space has the second word camelfied" do
    assert Camelfy.to_camel("string strong") == "stringStrong"
  end

  test "two words separated by a space has the first and second word camelfied if the first word is capitalized" do
    assert Camelfy.to_camel("String strong") == "StringStrong"
  end

  test "n words separated by spaces are camelfied" do
    assert Camelfy.to_camel("string strong gong bing") == "stringStrongGongBing"
  end

  test "two words separated by dashes are camelfied" do
    assert Camelfy.to_camel("string-strong") == "stringStrong"
  end

  test "words separated by dashes and underlines are camelfied" do
    assert Camelfy.to_camel("string-strong_strang") == "stringStrongStrang"
  end

  test "words separated by multiple dashes, spaces, and underlines are camelfied" do
    assert Camelfy.to_camel("string--strong__strang  sting") == "stringStrongStrangSting"
  end

  test "words separated by a mixture of dashes, underscores, and spaces are camelfied" do
    assert Camelfy.to_camel("string-_-strong _strang    -sting") == "stringStrongStrangSting"
    assert Camelfy.to_camel("String-_-strong _strang    -sting") == "StringStrongStrangSting"
  end
end
