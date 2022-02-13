# frozen_string_literal: true

FactoryBot.define do
  factory :purchase_order do
    client
    date { Date.current }
  end
end
