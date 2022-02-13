# frozen_string_literal: true

class PurchaseOrder < ApplicationRecord
  belongs_to :client

  validates :date, presence: true
end
