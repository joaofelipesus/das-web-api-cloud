# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_order do
    client { nil }
    date { '2022-02-13' }
  end
end
