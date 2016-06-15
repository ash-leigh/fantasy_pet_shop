require_relative('pet_shop')
require_relative('pet')
require_relative('customer')

class Viewer
  def initialize
    @customer = Customer.new("name", 0)

    pet_1 = Pet.new("Fire", "Charamander",35)
    pet_2 = Pet.new("Water", "Squirtle",30)
    pet_3 = Pet.new("Fire", "Charizard",25)
    pet_4 = Pet.new("Grass", "Bulbasaur",40)

    pets = [ pet_1,pet_2,pet_3,pet_4 ]

    @pet_shop = PetShop.new( pets )

  end

  def start
    puts "Welcome to the Pet Shop!!"
    puts "What's your name?"
    name = gets.chomp()
    @customer.name = name
    puts "Hello #{name} what is your budget for a Pokemon today?"
    cash = gets.to_f
    @customer.cash = cash
    can_customer_afford_an_animal(cash)
  end

  def can_customer_afford_an_animal(cash)
    afforable_animals = @pet_shop.get_pet_by_price(cash)

    if afforable_animals.length > 0
      display_affordable_animals(cash)
    else
      puts "I'm sorry, you can't afford anything today"
    end  
  end

  def display_affordable_animals(cash)
    afforable_animals = @pet_shop.get_pet_by_price(cash)
    puts "Here are the Pokemon you can afford today;"
    
    for animal in afforable_animals 
        puts animal.breed 
        puts animal.type
        puts "£#{animal.price}" 
    end
    puts "Which one would you like to buy?"
    breed_choice = gets.chomp
    customer_buys_pet(breed_choice)
  end

  def customer_buys_pet(breed_choice)
    chosen_breed = @pet_shop.get_pet_by_breed(breed_choice)
    @pet_shop.get_pet(@pet_shop.get_pet_by_breed(chosen_breed))
    #puts "#{@pet_shop.number_of_pets_in_shop}"
    #@pet_shop.get_pet
    # @customer.take_pet(pet_shop)
    # @pet_shop.receives_cash(cash)
  end

end

viewer = Viewer.new()
viewer.start()