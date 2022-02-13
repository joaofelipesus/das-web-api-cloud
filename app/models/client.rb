# frozen_string_literal: true

class Client < ApplicationRecord
  has_many :purchase_orders

  validates :name, :surname, :cpf, presence: true

  validates :cpf, uniqueness: true

  validates_with CpfValidator
end
