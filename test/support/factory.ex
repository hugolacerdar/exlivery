defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Hugo",
      email: "hugo@banana.com",
      cpf: "12312313222",
      age: 26,
      address: "Rua das Bananas"
    }
  end

  def item_factory do
    %Item{
      category: :pizza,
      description: "Vegfredo",
      quantity: 1,
      unity_price: Decimal.new(35)
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das Bananas",
      items: [
        build(:item),
        build(:item,
          description: "Hamburguer de falafel",
          category: :hamburguer,
          quantity: 2,
          unity_price: Decimal.new("18.50")
        )
      ],
      total_price: Decimal.new("72.00"),
      user_cpf: "12312313222"
    }
  end
end
