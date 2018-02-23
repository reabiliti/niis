class Solution < ApplicationRecord
  belongs_to :conclusion
  has_one :certificate, dependent: :destroy
end
