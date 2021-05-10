defmodule ExliveryTest.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns user" do
      response =
        User.build(
          "Hugo",
          "hugo@banana.com",
          "12312313222",
          26,
          "Rua das Bananas"
        )

      expected = {:ok, build(:user)}

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
