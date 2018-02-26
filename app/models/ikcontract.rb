class Ikcontract < ApplicationRecord
  belongs_to :certificate, inverse_of: :ikcontract
  validates_uniqueness_of :certificate_id
end
