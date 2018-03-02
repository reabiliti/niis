class Solution < ApplicationRecord
  belongs_to :conclusion, inverse_of: :solution
  validates :conclusion_id, uniqueness: true
  has_many :certificates, dependent: :destroy, inverse_of: :solution
end
