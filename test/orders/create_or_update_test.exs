defmodule Exlivery.Orders.CreateOrUpdateTest do
  use ExUnit.Case

  import Exlivery.Factory

  alias Exlivery.Orders.CreateOrUpdate
  alias Exlivery.Users.Agent, as: UserAgent

  describe "call/1" do
    setup do
      cpf = "12343424323"
      user = build(:user, cpf: cpf)

      Exlivery.start_agents()
      UserAgent.save(user)

      item1 = %{
        category: :pizza,
        description: "Pizza",
        quantity: 1,
        unity_price: "35.50"
      }

      item2 = %{
        category: :sobremesa,
        description: "Sorvete",
        quantity: 2,
        unity_price: "16.50"
      }

      {:ok, user_cpf: cpf, item1: item1, item2: item2}
    end

    test "when all params are valid, saves the order", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      assert {:ok, _uuid} = response
    end

    test "when the cpf is invalid, returns an error", %{
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: "0000000000", items: [item1, item2]}

      response = CreateOrUpdate.call(params)

      expected = {:error, "User not found"}
      assert response == expected
    end

    test "when any item is invalid, returns an error", %{
      user_cpf: cpf,
      item1: item1,
      item2: item2
    } do
      params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}

      response = CreateOrUpdate.call(params)

      expected = {:error, "Invalid items"}

      assert response == expected
    end

    test "when there are no items, returns an error", %{
      user_cpf: cpf
    } do
      params = %{user_cpf: cpf, items: []}

      response = CreateOrUpdate.call(params)

      expected = {:error, "Invalid parameters"}

      assert response == expected
    end
  end
end
