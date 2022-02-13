# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:surname) }
  it { should validate_presence_of(:cpf) }

  it { should validate_uniqueness_of(:cpf) }
end
