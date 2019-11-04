# frozen_string_literal: true

require_relative "mug"

class MegaMug < Mug
  attr_reader :beverage

  DOCS = "https://dayofcode.co.uk"

  def glug
    raise "Oh no! Empty mug" if empty?

    @beverage = nil
    puts "(Your beverage has been glugged)"
  end

  def empty?
    return true unless @beverage

    false
  end

  def fill_with(beverage: :coffee)
    raise "Mug already full" unless empty?

    super
  end

  def use
    puts "What is your beverage of choice?"
    fill_with(beverage: gets.chomp)
    (/darwin/ =~ RUBY_PLATFORM) ? `open "#{DOCS}"` : `start "#{DOCS}"`
    "Enjoy your #{@beverage} whilst you read #{DOCS}"
  end
end
