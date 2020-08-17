defmodule JSONParserTest do
  use ExUnit.Case
  doctest JSONParser

  test "greets the world" do
    assert JSONParser.hello() == :world
  end
end
