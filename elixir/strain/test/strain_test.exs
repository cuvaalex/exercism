defmodule StrainTest do
  use ExUnit.Case

  defp is_odd?(n), do: rem(n, 2) == 1
  defp is_even?(n), do: rem(n, 2) == 0
  defp noop(_), do: true

  # @tag :skip
  test "empty keep" do
    assert Strain.keep([], &noop/1) == []
  end

  @tag :skip
  test "keep everything" do
    assert Strain.keep([1, 2, 3], fn e -> e < 10 end) == [1, 2, 3]
  end

  @tag :skip
  test "keep first and last" do
    assert Strain.keep([1, 2, 3], &is_odd?/1) == [1, 3]
  end

  @tag :skip
  test "keep neither first nor last" do
    assert Strain.keep([1, 2, 3, 4, 5], &is_even?/1) == [2, 4]
  end

  @tag :skip
  test "keep strings" do
    words = ~w(apple zebra banana zombies cherimoya zelot)
    assert Strain.keep(words, &String.starts_with?(&1, "z")) == ~w(zebra zombies zelot)
  end

  @tag :skip
  test "keep arrays" do
    rows = [
      [1, 2, 3],
      [5, 5, 5],
      [5, 1, 2],
      [2, 1, 2],
      [1, 5, 2],
      [2, 2, 1],
      [1, 2, 5]
    ]

    assert Strain.keep(rows, fn row -> 5 in row end) == [
             [5, 5, 5],
             [5, 1, 2],
             [1, 5, 2],
             [1, 2, 5]
           ]
  end

  @tag :skip
  test "empty discard" do
    assert Strain.discard([], &noop/1) == []
  end

  @tag :skip
  test "discard nothing" do
    assert Strain.discard([1, 2, 3], fn e -> e > 10 end) == [1, 2, 3]
  end

  @tag :skip
  test "discard first and last" do
    assert Strain.discard([1, 2, 3], &is_odd?/1) == [2]
  end

  @tag :skip
  test "discard neither first nor last" do
    assert Strain.discard([1, 2, 3, 4, 5], &is_even?/1) == [1, 3, 5]
  end

  @tag :skip
  test "discard strings" do
    words = ~w(apple zebra banana zombies cherimoya zelot)
    assert Strain.discard(words, &String.starts_with?(&1, "z")) == ~w(apple banana cherimoya)
  end

  @tag :skip
  test "discard arrays" do
    rows = [
      [1, 2, 3],
      [5, 5, 5],
      [5, 1, 2],
      [2, 1, 2],
      [1, 5, 2],
      [2, 2, 1],
      [1, 2, 5]
    ]

    assert Strain.discard(rows, fn row -> 5 in row end) == [[1, 2, 3], [2, 1, 2], [2, 2, 1]]
  end
end
