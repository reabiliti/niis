# frozen_string_literal: true

require 'rails_helper'

describe Conclusion, type: :model do
  subject { create(:conclusion) }

  it { is_expected.to validate_presence_of :date_from }
  it { is_expected.to validate_presence_of :number }
  it { is_expected.to validate_presence_of :cert_expiry_date }
  it { is_expected.to validate_presence_of :sign_date }
  it { is_expected.to validate_uniqueness_of :solution_proposal_id }
  it { is_expected.to belong_to :solution_proposal }
  it { is_expected.to have_one(:solution).dependent(:destroy) }
end
