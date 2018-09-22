# frozen_string_literal: true

require 'rails_helper'

describe Certcontract, type: :model do
  subject { create(:certcontract) }

  it { is_expected.to validate_uniqueness_of :proposal_id }
  it { is_expected.to validate_presence_of :registration_num }
  it { is_expected.to validate_presence_of :registration_date }
  it { is_expected.to validate_presence_of :date_from }
  it { is_expected.to validate_presence_of :date_expiry }
  it { is_expected.to belong_to :proposal }
end
