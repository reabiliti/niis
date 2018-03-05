class Certcontract < ApplicationRecord
  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :cecon_registration_num, :cecon_registration_date, :cecon_date_from,
            :cecon_date_expiry, presence: true
end
