# frozen_string_literal: true

class CpfValidator < ActiveModel::Validator
  def validate(client)
    return if client.cpf.nil?

    client.errors.add(:cpf, 'is invalid') unless CPF.valid?(client.cpf)
  end
end
