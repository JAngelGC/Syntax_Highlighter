defmodule SyntaxTest do
  use ExUnit.Case
  doctest Syntax

  test "greets the world" do
    assert Syntax.hello() == :world
  end
end
