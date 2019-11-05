# frozen_string_literal: true

require_relative "basic_mug"

class Mug < BasicMug
  attr_reader :beverage

  DOCS = "https://dayofcode.co.uk"

  def glug
    raise "Oh no! Empty mug" if empty?

    @beverage = nil
    puts "(Your beverage has been glugged)"
  end

  def sip
    raise "Oh no! Empty mug" if empty?

    puts "(Your beverage has been sipped)"
  end

  def empty?
    return true unless @beverage

    false
  end

  def full?
    !empty?
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
