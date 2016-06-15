class PetShop

  attr_reader :total

  def initialize( pets )
    @pets = pets
    @total = 0
  end

  def number_of_pets_in_shop
    @pets.length()
  end

  def get_pet(pet_sold)
    @pets.delete(pet_sold)
  end

  def get_pet_by_price(cash)
    affordable_pets = []

    for pet in @pets
      affordable_pets << pet if pet.price <= cash
    end
      return affordable_pets 
  end

  def get_pet_by_breed(breed_choice)
    chosen_pet_breed = []

    for pet in @pets
      chosen_pet_breed << pet if pet.breed == breed_choice
    end
    return chosen_pet_breed
  end

  def receives_cash(cash)
    return @total = @total + cash
  end

end