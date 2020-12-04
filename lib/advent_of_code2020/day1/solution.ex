defmodule AdventOfCode2020.Day1.Solution do
  @moduledoc """
  Solution(s) for Day 1 AoC 2020 problem
  """

  @input_file "priv/day1_input.txt"
  @target 2020

  @doc """
  Return the part one solution for the input file.
  """
  def run_p1 do
    build_input_data()
    |> solve_p1(@target)
  end

  @doc """
  Return the part two solution for the input file.
  """
  def run_p2 do
    build_input_data()
    |> solve_p2()
  end

  defp solve_p1(items, target), do: solve_p1(items, MapSet.new(), target, nil)
  defp solve_p1(_items, _set, _target, result) when is_integer(result), do: result
  defp solve_p1([], _set, _target, result), do: result
  defp solve_p1([item | items], set, target, _result) do
    result =
      case MapSet.member?(set, (target - item)) do
        true -> ((target - item) * item)
        false -> nil
      end

    solve_p1(items, MapSet.put(set, item), target, result)
  end

  defp solve_p2(items), do: solve_p2(items, items, nil)
  defp solve_p2(_items, _items_copy, result) when is_integer(result), do: result
  defp solve_p2([], _items_copy, result), do: result
  defp solve_p2([item | items], items_copy, _result) do
    case solve_p1(items_copy, (@target - item)) do
      nil -> solve_p2(items, items_copy, nil)
      result -> (item * solve_p2(items, items_copy, result))
    end
  end

  defp build_input_data do
    File.stream!(@input_file)
    |> Stream.map(&(String.replace(&1, "\n", "")))
    |> Stream.filter(&(!is_nil(&1)))
    |> Stream.map(&(String.to_integer(&1)))
    |> Enum.to_list()
  end
end
