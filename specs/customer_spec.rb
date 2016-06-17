require 'minitest/autorun'
require_relative'../customer.rb'
require_relative'../pet_shop.rb'
require_relative'../pet.rb'

class TestCustomer <Minitest:: Test

  def setup
    @customer = Customer.new("Marie", 50)

    pet_1 = Pet.new("Fire", "Charamander",25)
    pet_2 = Pet.new("Water", "Squirtle",30)
    pet_3 = Pet.new("Fire", "Charizard",25)
    pet_4 = Pet.new("Grass", "Bulbasaur",40)

    pets = [ pet_1,pet_2,pet_3,pet_4 ]

    @pet_shop = PetShop.new( pets )

  end

  def test_customer_name
    assert_equal("Marie", @customer.name)
  end

  def test_customer_has_cash
    assert_equal(50,@customer.cash)
  end

  def test_customer_has_not_bought_pets
    assert_equal(0,@customer.pet_purchases())
  end

  def test_customer_takes_pet
    @customer.take_pet(@pet_shop, "Bulbasaur")
    assert_equal(1, @customer.pet_purchases())
  end

  def test_pays_for_pet
    @customer.pays_for_pet(@pet_shop.get_price_of_chosen_pet("Bulbasaur"))
    assert_equal(10, @customer.cash)
  end

end