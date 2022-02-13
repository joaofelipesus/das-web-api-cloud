# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    cpf { 'MyString' }
    name { 'MyString' }
    surname { 'MyString' }
  end
end
