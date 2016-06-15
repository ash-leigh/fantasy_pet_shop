require'minitest/autorun'
require_relative'../pet_shop.rb'
require_relative'../pet.rb'
require_relative'../customer.rb'



class TestPetShop < Minitest::Test
  def setup
    @customer = Customer.new("Marie", 25)

    pet_1 = Pet.new("Fire", "Charamander",35)
    pet_2 = Pet.new("Water", "Squirtle",30)
    pet_3 = Pet.new("Fire", "Charizard",25)
    pet_4 = Pet.new("Grass", "Bulbasaur",40)

    pets = [ pet_1,pet_2,pet_3,pet_4 ]

    @pet_shop = PetShop.new( pets )
  end

  def test_pet_shop_stock
    assert_equal(4, @pet_shop.number_of_pets_in_shop())
  end

  def test_can_get_pet
    purchased_pet = @pet_shop.get_pet_by_breed("Bulbasaur")
    assert_equal(3, @pet_shop.number_of_pets_in_shop())
  end

  def test_pet_leaves_pet_shop
    @pet_shop.get_pet("Bulbasaur")
    assert_equal(3,@pet_shop.number_of_pets_in_shop())
  end

  def test_get_pet_by_price
    pets = @pet_shop.get_pet_by_price(@customer.cash)
    assert_equal(1, pets.count)
  end

  def test_get_pet_by_breed
    pets = @pet_shop.get_pet_by_breed("Bulbasaur")
    assert_equal(1, pets.count)

  end

  def test_pet_shop_total_cash
    assert_equal(0,@pet_shop.total)
  end

  def test_pet_shop_receieves_cash
     @pet_shop.receives_cash(@pet_shop.get_pet.price("Bulbasaur"))
     assert_equal(40, @pet_shop.total)
  end


end