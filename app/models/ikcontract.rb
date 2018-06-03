# frozen_string_literal: true

# model IK contracts
class Ikcontract < ApplicationRecord
  belongs_to :certificate, inverse_of: :ikcontract
  validates :certificate_id, uniqueness: true
  validates :ikcon_registration_num, :ikcon_registration_date, presence: true

  INSPECTION_PERIOD = %w[один\ раз\ в\ месяц один\ раз\ в\ квартал один\ раз\ в\ полгода один\ раз\ в\ год].freeze
  DECLENSION_NAME = %w[именуемый именуемая именуемое].freeze
  DECLENSION_ACTIVE = %w[действующего действующей действующий действующее действующая].freeze
end
