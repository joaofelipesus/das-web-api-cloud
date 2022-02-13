# frozen_string_literal: true

class OrderItem < ApplicationRecord
  belongs_to :product
  belongs_to :purchase_order

  validates :quantity, presence: true
end
