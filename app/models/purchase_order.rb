# frozen_string_literal: true

class PurchaseOrder < ApplicationRecord
  belongs_to :client
  has_many :order_items

  validates :date, presence: true
end
