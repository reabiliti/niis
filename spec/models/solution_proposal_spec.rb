# frozen_string_literal: true

require 'rails_helper'

describe SolutionProposal, type: :model do
  subject { create(:solution_proposal) }

  it { is_expected.to validate_uniqueness_of :proposal_id }
  it { is_expected.to validate_presence_of :date_from }
  it { is_expected.to validate_presence_of :number }
  it { is_expected.to belong_to :proposal }
  it { is_expected.to have_many(:protocols).dependent(:destroy) }
  it { is_expected.to have_one(:conclusion).dependent(:destroy) }
end
