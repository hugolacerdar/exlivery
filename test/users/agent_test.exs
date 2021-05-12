defmodule Exlivery.Users.AgentTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.User
  import Exlivery.Factory

  describe "save/1" do
    test "saves the user" do
      user = build(:user)
      UserAgent.start_link(%{})
      assert UserAgent.save(user) == :ok
    end
  end

  describe "get/1" do
    setup do
      UserAgent.start_link(%{})

      cpf = "123454556777"

      {:ok, cpf: cpf}
    end

    test "when the user is found, returns the user", %{cpf: cpf} do
      :user
      |> build(cpf: cpf)
      |> UserAgent.save()

      response = UserAgent.get(cpf)

      expected =
        {:ok,
         %User{
           address: "Rua das Bananas",
           age: 26,
           cpf: "123454556777",
           email: "hugo@banana.com",
           name: "Hugo"
         }}

      assert response == expected
    end

    test "when the user isn't found, returns an error" do
      response = UserAgent.get("00000000000")

      expected = {:error, "User not found"}

      assert response == expected
    end
  end
end
