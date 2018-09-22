# frozen_string_literal: true

# == Schema Information
#
# Table name: settings
#
#  id                   :bigint(8)        not null, primary key
#  at_x                 :integer
#  at_y                 :integer
#  name                 :string
#  org_address          :string
#  org_based_doc        :string
#  org_chief_accountant :string
#  org_chief_name       :string
#  org_chief_position   :string
#  org_name             :string
#  org_phone            :string
#  org_postcode         :string
#  os_address           :string
#  os_based_doc         :string
#  os_chief_name        :string
#  os_chief_position    :string
#  os_city              :string
#  os_name              :string
#  os_postcode          :string
#  os_registration_date :datetime
#  os_registration_num  :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

# This model store setting certification organization
class Setting < ApplicationRecord
  validates :os_registration_num, :os_registration_date, presence: true
  validates :at_x, numericality: { only_integer: true }
  validates :at_y, numericality: { only_integer: true }
end
