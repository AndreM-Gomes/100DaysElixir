defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.split(sentence," ")
    |>Enum.map(fn element -> String.downcase element end)
    |>Enum.map(
    fn element ->
      map = %{}
      Map.put(map,element,1)
    end)
    |>Enum.reduce( fn element, accumulator ->
      Map.merge(element,accumulator, fn _k,v1,v2 -> v1+v2 end)
    end)
  end
end
