defmodule Exlivery.Orders.ReportTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.Agent, as: OrderAgent
  alias Exlivery.Orders.Report

  describe "create/1" do
    test "creates the report file" do
      OrderAgent.start_link(%{})

      :order
      |> build()
      |> OrderAgent.save()

      :order
      |> build()
      |> OrderAgent.save()

      expected =
        "12312313222,pizza,1,35,hamburguer,2,18.50,72.00\n" <>
          "12312313222,pizza,1,35,hamburguer,2,18.50,72.00\n"

      Report.create("report_test.csv")

      response = File.read!("report_test.csv")

      assert response == expected
    end
  end
end
