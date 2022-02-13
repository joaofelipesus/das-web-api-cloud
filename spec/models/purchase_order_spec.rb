# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  it { should belong_to(:client) }

  it { should validate_presence_of(:date) }
end
