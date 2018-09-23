# frozen_string_literal: true

require 'rails_helper'

describe Protocol, type: :model do
  it { is_expected.to validate_presence_of :date_from }
  it { is_expected.to belong_to :solution_proposal }
end
