class Ikcontract < ApplicationRecord
  belongs_to :certificate, inverse_of: :ikcontract
  validates :certificate_id, uniqueness: true
end
