class Solution < ApplicationRecord
  belongs_to :conclusion, inverse_of: :solution
  validates_uniqueness_of :conclusion_id
  has_one :certificate, dependent: :destroy, inverse_of: :solution
end
