class Waiter
    attr_reader :name, :expereince

    @@all = []

    def initialize(name, expereince)
        @name = name
        @expereince = expereince
        @@all.push(self)
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select{|meal| meal.waiter == self}
    end

    def best_tipper
        self.meals.max_by{|meal| meal.tip}.customer
    end
end