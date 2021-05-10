defmodule ExliveryTest.Users.UserTest do
  use ExUnit.Case
  alias Exlivery.Users.User

  describe "build/5" do
    test "when all params are valid, returns user" do
      response =
        User.build(
          "Lia",
          "lia@lia.com",
          "123.123.123-12",
          21,
          "Rua 2"
        )

      expected =
        {:ok,
         %Exlivery.Users.User{
           address: "Rua 2",
           age: 21,
           cpf: "123.123.123-12",
           email: "lia@lia.com",
           name: "Lia"
         }}

      assert response == expected
    end

    test "when there are invalid params, returns an error" do
      response =
        User.build(
          "Lia",
          "lia@lia.com",
          "123.123.123-12",
          11,
          "Rua 2"
        )

      expected = {:error, "Invalid params"}

      assert response == expected
    end
  end
end
