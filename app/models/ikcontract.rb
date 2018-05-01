# frozen_string_literal: true

class Ikcontract < ApplicationRecord
  belongs_to :certificate, inverse_of: :ikcontract
  validates :certificate_id, uniqueness: true
  validates :ikcon_registration_num, :ikcon_registration_date, presence: true
end
