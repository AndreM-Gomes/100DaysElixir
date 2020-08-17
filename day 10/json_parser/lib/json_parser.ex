defmodule JSONParser do
  def parseObject(object) do
    list = String.to_charlist(object)
    |>Enum.map( fn char ->
      case char do
        x when x == ?{ -> %{:l_curly_brackets => nil}
        x when x == ?} -> %{:r_curly_brackets => nil}
        x -> %{:alphanum => x}
      end
    end)
    |>Enum.chunk_by(fn element ->
      Map.has_key?(element,:alphanum)
    end)
    list_size = Enum.count(list) - 2
    content = Enum.slice(list,1..list_size) |> Enum.flat_map(&(&1))

    string = content |> Enum.reduce(fn element, acc ->
      Map.merge(acc, element,fn _key, v1, v2 -> [v1]++[v2] end)
    end)
    |>Map.get(:alphanum)
    |>flatten
    '{'++ string ++ '}'

  end

  defp flatten([head | tail]), do: flatten(head) ++ flatten(tail)
  defp flatten([]), do: []
  defp flatten(element), do: [element]
end
