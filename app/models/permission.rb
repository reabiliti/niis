class Permission < ApplicationRecord
  belongs_to :certificate, inverse_of: :permission
  validates :certificate_id, uniqueness: true
end
