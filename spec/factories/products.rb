# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    description { Faker::Superhero.unique.power }
  end
end
