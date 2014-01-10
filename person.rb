class Person 

  attr_accessor :allergies, :stomach 

  def initialize(allergies)
    @allergies = allergies 
    @stomach = [] 
  end

  # this function takes and argument food that is an array that is then passed 
  # into the stomach via the check_allergy method
  def eat(dinner)
    check_allergy(dinner)
  end 

  def check_allergy(food)
    begin
      unless food.include?(@allergies)
        @stomach += food
          puts 'You just enjoyed a delicious meal'
          # stomcah takes the food array
      else 
        @stomach = []
        raise AllergyError.new("You just threw up because you are allergic to #{allergies}")
      end 
      # rescue has to come after the loop
    rescue AllergyError => e
      puts "#{e}"
    end 
  end 

end 


class AllergyError < ArgumentError

end 

pizza = ["cheese", "gluten", "tomatoes"]
pan_seared_scallops = ["scallops", "lemons", "pasta", "olive oil"]
water = ["h", "h", "o"]

chris = Person.new('gluten')
chris.eat(pizza)
chris.eat(pan_seared_scallops)
chris.eat(water)

beth = Person.new('scallops')
beth.eat(pizza)
beth.eat(pan_seared_scallops)
beth.eat(water)
