# frozen_string_literal: true

class Mug
  def fill_with(beverage: :coffee)
    @beverage = beverage
    puts "Your mug is filled with #{beverage}"
  end

  def use
    puts "What is your beverage of choice?"
    fill_with(beverage: gets.chomp)
    "Enjoy your #{@beverage} on Day of Code!"
  end
end
