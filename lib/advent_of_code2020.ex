defmodule AdventOfCode2020 do
  @moduledoc """
  Documentation for `AdventOfCode2020`.
  """

  @doc """
  Run the solutions for all days
  """
  def run_all do
    IO.puts "\n--- Advent of Code 2020 ---\n\n"

    IO.puts "Day 1 Result(s)"
    day1p1() |> IO.inspect(label: "* Part 1")
    day1p2() |> IO.inspect(label: "* Part 2")
    IO.puts "\n"

    IO.puts "\n\n"
  end

  @doc """
  Runs the day 1 part 1 solution
  """
  def day1p1, do: AdventOfCode2020.Day1.Solution.run_p1()

  @doc """
  Runs the day 1 part 2 solution
  """
  def day1p2, do: AdventOfCode2020.Day1.Solution.run_p2()
end
