defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    token = sentence
    |> String.downcase
    |> String.split(~r{(\\n|[\s',!\\&@$%:^_])+})
    |> Enum.filter(fn x -> x != "" end)

    Enum.reduce token, Map.new, &count_word/2
  end

  def count_word(word, map) do
    Map.update(map, word, 1, &(&1 + 1))
  end
end
