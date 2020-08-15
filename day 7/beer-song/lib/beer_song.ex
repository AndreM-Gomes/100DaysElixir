defmodule BeerSong do
  @doc """
  Get a single verse of the beer song
  """

  def verse(2) do
    """
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
    """
  end

  def verse(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end
  @spec verse(integer) :: String.t()
  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end
  @spec verse(integer) :: String.t()
  def verse(number) do
    """
    #{ number } bottles of beer on the wall, #{number} bottles of beer.
    Take one down and pass it around, #{number - 1} bottles of beer on the wall.
    """
  end
  @doc """
  Get the entire beer song for a given range of numbers of bottles.
  """
  def lyrics() do
    99..0
    |>Enum.map( fn number -> verse number end)
    |>Enum.reduce( fn verse,acc -> acc <>"\n"<> verse  end)
  end
  @spec lyrics(Range.t()) :: String.t()
  def lyrics(range) do
    range
    |>Enum.map( fn number -> verse number end)
    |>Enum.reduce( fn verse,acc -> acc <>"\n"<> verse  end)
  end

end
