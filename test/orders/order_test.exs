defmodule ExliveryTest.Orders.Order do
  use ExUnit.Case

  alias Exlivery.Orders.Order

  import Exlivery.Factory

  describe "build/2" do
    test "when all params are valid, returns an order" do
      user = build(:user)

      items = [
        build(:item),
        build(:item,
          description: "Hamburguer de falafel",
          category: :hamburguer,
          quantity: 2,
          unity_price: Decimal.new("18.50")
        )
      ]

      response = Order.build(user, items)

      expected = {:ok, build(:order)}

      assert response == expected
    end

    test "when all item list is empty, returns an error" do
      user = build(:user)

      items = []

      response = Order.build(user, items)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
