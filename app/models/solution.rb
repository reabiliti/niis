class Solution < ApplicationRecord
  belongs_to :conclusion, inverse_of: :solution
  validates :conclusion_id, uniqueness: true
  has_one :certificate, dependent: :destroy, inverse_of: :solution
end
