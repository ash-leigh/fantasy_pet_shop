class PetShop

  attr_reader :total, :get_pet

  def initialize( pets )
    @pets = pets
    @total = 0
  end

  def number_of_pets_in_shop
    @pets.length()
  end

  def get_pet(pet_sold)
    @pets.delete_if {|pet| pet.breed == pet_sold}
  end

  def get_pet_by_price(cash)
    affordable_pets = []

    for pet in @pets
      affordable_pets << pet if pet.price <= cash
    end
      return affordable_pets 
  end

  def get_pet_by_breed(breed_choice)
   pet = @pets.find {|pet| pet.breed == breed_choice}
   return pet.breed
  end

  def get_price_of_chosen_pet(breed_choice)
     pet = @pets.find {|pet| pet.breed == breed_choice}
     return pet.price
  end

  def receives_cash(cash)
    return @total = @total + cash
  end

end