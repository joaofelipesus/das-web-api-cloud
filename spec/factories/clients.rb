# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    cpf { CPF.generate }
    name { Faker::TvShows::SiliconValley.character }
    surname { Faker::TvShows::SiliconValley.app }
  end
end
