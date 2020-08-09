defmodule Fibonacci do
  def fibo(n,a\\0,b\\1) do
    cond do
      n==0->a
      n==1->b
      true->fibo(n-1,b,a+b)
    end
  end
end
# First Day
# Fibonacci implemented with tail call recursion