defmodule ExliveryTest.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("Vegfredo", :pizza, 35, 1)

      expected = {:ok, build(:item)}

      assert response == expected
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("Vegfredo", :banana, 35, 1)

      expected = {:error, "Invalid params"}

      assert response == expected
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("Vegfredo", :pizza, "banana", 1)

      expected = {:error, "Invalid unity price"}

      assert response == expected
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("Vegfredo", :pizza, 35, 0)

      expected = {:error, "Invalid params"}

      assert response == expected
    end
  end
end
