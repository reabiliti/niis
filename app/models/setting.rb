# frozen_string_literal: true

# == Schema Information
#
# Table name: settings
#
#  id                       :bigint(8)        not null, primary key
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  name                 :string
#  at_x                 :integer
#  at_y                 :integer
#  os_registration_num  :string
#  os_registration_date :datetime
#  os_name              :string
#  os_address           :string
#  os_chief_position    :string
#  os_chief_name        :string
#  os_based_doc         :string
#  org_name             :string
#  org_address          :string
#  org_phone            :string
#  org_chief_position   :string
#  org_chief_name       :string
#  org_based_doc        :string
#  org_chief_accountant :string
#  os_city              :string
#

class Setting < ApplicationRecord
  validates :os_registration_num, :os_registration_date, presence: true
  validates :at_x, numericality: { only_integer: true }
  validates :at_y, numericality: { only_integer: true }
end
