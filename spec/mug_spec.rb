# frozen_string_literal: true

require "spec_helper"
require "byebug"
require_relative "../mega_mug"

RSpec.describe MegaMug do
  let(:subject) { described_class.new }
  let(:beverage) { nil }

  describe "filling the mug" do
    before do
      subject.fill_with(beverage: beverage)
    end

    it "is empty" do
      expect(subject.empty?).to be true
    end

    context "with a beverage" do
      let(:beverage) { "iced tea" }

      it "is not empty" do
        expect(subject.empty?).to be false
      end

      it "contains the beverage" do
        expect(subject.beverage).to be "iced tea"
      end
    end

    context "when already full" do
      let(:beverage) { "minty tea" }

      it "doesn't fill with a beverage" do
        expect{subject.fill_with}.to raise_error("Mug already full")
      end

      it "is not empty" do
        expect(subject.empty?).to be false
      end
    end
  end
end
