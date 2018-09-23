# frozen_string_literal: true

require 'rails_helper'

describe Inventory, type: :model do
  subject { create(:inventory) }

  it { is_expected.to validate_uniqueness_of :proposal_id }
  it { is_expected.to validate_presence_of :date_from }
  it { is_expected.to belong_to :proposal }
end
