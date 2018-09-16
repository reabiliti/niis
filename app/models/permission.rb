# frozen_string_literal: true

class Permission < ApplicationRecord
  belongs_to :certificate, inverse_of: :permission
  validates :certificate_id, uniqueness: true
  validates :perm_registration_num, :perm_registration_date, :perm_expiry_date, presence: true
end
