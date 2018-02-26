class Permission < ApplicationRecord
  belongs_to :certificate, inverse_of: :permission
  validates_uniqueness_of :certificate_id
end
