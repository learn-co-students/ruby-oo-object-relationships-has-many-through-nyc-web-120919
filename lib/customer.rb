require 'pry'
class Customer
  
    attr_reader :name, :age
    attr_accessor :tip
    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end 

    def self.all
        @@all
    end 
    
    def new_meal(waiter, amount, tip=0)
        #binding.pry 
        Meal.new(waiter, self, amount, tip)
    end 

    def meals
        Meal.all.select do |meal|
        #binding.pry 
            meal.customer == self
        end
    end 

    def waiters
        meals.map do |meal|
            meal.waiter 
        end
    end 

end