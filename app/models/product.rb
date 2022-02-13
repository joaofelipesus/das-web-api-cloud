# frozen_string_literal: true

class Product < ApplicationRecord
  validates :description, presence: true
end
