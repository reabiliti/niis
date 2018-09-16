# frozen_string_literal: true

# == Schema Information
#
# Table name: permissions
#
#  id                     :bigint(8)        not null, primary key
#  certificate_id         :bigint(8)
#  perm_registration_num  :string
#  perm_registration_date :datetime
#  perm_expiry_date       :datetime
#  perm_place_marking     :string
#  perm_chief_name        :string
#  perm_chief_org         :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class Permission < ApplicationRecord
  belongs_to :certificate, inverse_of: :permission
  validates :certificate_id, uniqueness: true
  validates :perm_registration_num, :perm_registration_date, :perm_expiry_date, presence: true
end
