# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    product { nil }
    purchase_order { nil }
  end
end
