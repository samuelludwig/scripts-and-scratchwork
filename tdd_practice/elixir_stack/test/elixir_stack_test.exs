defmodule ElixirStackTest do
  use ExUnit.Case

  setup do
    {:ok, pid} = ElixirStack.new()
    [stack_pid: pid]
  end

  setup context do
    IO.puts("Setting up #{context.test}")
    :ok
  end

  test "can create a stack", context do
    stack = ElixirStack.get_stack(context[:stack_pid])
    assert is_list(stack)
  end

  test "check if a new stack is empty", context do
    stack = ElixirStack.get_stack(context[:stack_pid])
    assert Enum.empty?(stack)
  end

  test "pushing something onto the stack means the stack is no longer empty", context do
    ElixirStack.push(context[:stack_pid], 0)
    stack = ElixirStack.get_stack(context[:stack_pid])
    refute Enum.empty?(stack)
  end

  test "pushing onto a stack twice means it has two elements", context do
    ElixirStack.push(context[:stack_pid], 0)
    ElixirStack.push(context[:stack_pid], 1)
    stack = ElixirStack.get_stack(context[:stack_pid])
    assert Enum.count(stack) == 2
  end

  test "the most recent pushed value is the first element of the stack", context do
    ElixirStack.push(context[:stack_pid], 0)
    ElixirStack.push(context[:stack_pid], 1)
    stack = ElixirStack.get_stack(context[:stack_pid])
    assert List.first(stack) == 1
  end

  test "popping from the stack returns the most recently pushed value", context do
    ElixirStack.push(context[:stack_pid], 0)
    ElixirStack.push(context[:stack_pid], 1)
    assert ElixirStack.pop(context[:stack_pid]) == 1
  end

  test "after we push XY we pop YX", context do
    ElixirStack.push(context[:stack_pid], 0)
    ElixirStack.push(context[:stack_pid], 1)
    assert ElixirStack.pop(context[:stack_pid]) == 1
    assert ElixirStack.pop(context[:stack_pid]) == 0
  end
end
