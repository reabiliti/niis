# frozen_string_literal: true

# Model certificate contracs
class Certcontract < ApplicationRecord
  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :cecon_registration_num, :cecon_registration_date, :cecon_date_from, :cecon_date_expiry, presence: true

  DECLENSION_NAME = %w[именуемый именуемая именуемое].freeze
  DECLENSION_ACTIVE = %w[действующего действующей действующий действующее действующая].freeze
end
