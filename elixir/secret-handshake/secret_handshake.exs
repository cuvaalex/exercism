defmodule SecretHandshake do
  @doc """
  Determine the actions of a secret handshake based on the binary
  representation of the given `code`.

  If the following bits are set, include the corresponding action in your list
  of commands, in order from lowest to highest.

  1 = wink
  10 = double blink
  100 = close your eyes
  1000 = jump

  10000 = Reverse the order of the operations in the secret handshake
  """
  require Bitwise

  @spec commands(code :: integer) :: list(String.t())
  def commands(code) do
    handshake(<< code :: size(5) >>)
  end

  @code ["jump", "close your eyes", "double blink", "wink"]
  def handshake(<< reverse :: size(1), jump :: size(1), close :: size(1), double :: size(1), wink :: size(1) >>) do
    shake =
      [jump, close, double, wink]
      |> Enum.zip(@code)
      |> Enum.reduce([], fn
        {0, _}, acc -> acc
        {1, item}, acc -> [item | acc]
      end)

    if reverse == 1 do
      Enum.reverse(shake)
    else
      shake
    end
  end
end