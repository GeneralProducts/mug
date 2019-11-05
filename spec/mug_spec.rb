# frozen_string_literal: true

require "spec_helper"
require "byebug"
require_relative "../mug"

RSpec.describe Mug do
  let(:subject) { described_class.new }
  let(:beverage) { nil }

  describe "with no beverage provided" do
    before do
      subject.fill_with
    end

    it "contains the default beverage" do
      expect(subject.beverage).to be :coffee
    end

    it "is full" do
      expect(subject.full?).to be true
    end
  end

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

      it "is full" do
        expect(subject.full?).to be true
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

      it "is full" do
        expect(subject.full?).to be true
      end
    end
  end

  describe "glugging the mug" do
    it "is empty" do
      expect(subject.empty?).to be true
    end

    it "is not gluggable" do
      expect{subject.glug}.to raise_error("Oh no! Empty mug")
    end

    context "when full" do
      let(:beverage) { "iced tea" }

      before do
        subject.fill_with(beverage: beverage)
      end

      it "is gluggable" do
        expect(subject.glug).to be(nil)
      end

      it "is empty after a glug" do
        subject.glug
        expect(subject.empty?).to be true
      end
    end
  end

  describe "sipping the mug" do
    it "is not sippable" do
      expect{subject.sip}.to raise_error("Oh no! Empty mug")
    end

    context "when full" do
      let(:beverage) { "iced tea" }

      before do
        subject.fill_with(beverage: beverage)
      end

      it "is sippable" do
        expect(subject.sip).to be(nil)
      end

      it "is not empty after a sip" do
        subject.sip
        expect(subject.empty?).to be false
      end
    end
  end
end
