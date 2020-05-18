defmodule AwsS3ToolTest do
  use ExUnit.Case
  doctest AwsS3Tool

  test "greets the world" do
    assert AwsS3Tool.hello() == :world
  end
end
