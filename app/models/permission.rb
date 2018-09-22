# frozen_string_literal: true

# == Schema Information
#
# Table name: permissions
#
#  id                     :bigint(8)        not null, primary key
#  perm_chief_name        :string
#  perm_chief_org         :string
#  perm_expiry_date       :datetime
#  perm_place_marking     :string
#  perm_registration_date :datetime
#  perm_registration_num  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  certificate_id         :bigint(8)
#
# Indexes
#
#  index_permissions_on_certificate_id  (certificate_id)
#

class Permission < ApplicationRecord
  belongs_to :certificate, inverse_of: :permission
  validates :certificate_id, uniqueness: true
  validates :perm_registration_num, :perm_registration_date, :perm_expiry_date, presence: true
end
