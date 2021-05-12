defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})

      :ok
    end

    test "when all params are valid, saves the user" do
      params = %{
        name: "Hugo",
        email: "hugo@banana.com",
        cpf: "12312313222",
        age: 26,
        address: "Rua das Bananas"
      }

      response = CreateOrUpdate.call(params)

      expected = {:ok, "Success"}

      assert response == expected
    end

    test "when any of the params are invalid, returns an error" do
      params = %{
        name: "Hugo",
        email: "hugo@banana.com",
        cpf: "12312313222",
        age: 3,
        address: "Rua das Bananas"
      }

      response = CreateOrUpdate.call(params)

      expected = {:error, "Invalid params"}

      assert response == expected
    end
  end
end
