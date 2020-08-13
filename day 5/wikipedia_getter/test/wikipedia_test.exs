defmodule WikipediaTest do
  use ExUnit.Case
  doctest Wikipedia

  test "greets the world" do
    assert Wikipedia.hello() == :world
  end
end
