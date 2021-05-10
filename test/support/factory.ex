defmodule Exlivery.Factory do
  use ExMachina

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
end
