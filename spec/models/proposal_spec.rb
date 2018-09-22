# frozen_string_literal: true

require 'rails_helper'

describe Proposal, type: :model do
  subject { create(:proposal) }

  it { is_expected.to validate_uniqueness_of :number }
  it { is_expected.to validate_presence_of :date_from }
  it { is_expected.to validate_presence_of :number }
  it { is_expected.to have_one(:solution_proposal).dependent(:destroy) }
  it { is_expected.to have_one(:certcontract).dependent(:destroy) }
  it { is_expected.to have_one(:inventory).dependent(:destroy) }
end
