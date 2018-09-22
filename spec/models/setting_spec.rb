# frozen_string_literal: true

require 'rails_helper'

describe Setting, type: :model do
  it { is_expected.to validate_presence_of :os_registration_num }
  it { is_expected.to validate_presence_of :os_registration_date }
  it { is_expected.to validate_numericality_of(:at_x).only_integer }
  it { is_expected.to validate_numericality_of(:at_y).only_integer }
end
