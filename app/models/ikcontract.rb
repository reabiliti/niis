# frozen_string_literal: true

# == Schema Information
#
# Table name: ikcontracts
#
#  id                               :bigint(8)        not null, primary key
#  ikcon_cert_registration_num      :string
#  ikcon_client_active              :string
#  ikcon_client_address             :string
#  ikcon_client_bank_details        :string
#  ikcon_client_based_doc           :string
#  ikcon_client_chief_name          :string
#  ikcon_client_chief_name_sign     :string
#  ikcon_client_chief_position      :string
#  ikcon_client_chief_position_sign :string
#  ikcon_client_name                :string
#  ikcon_client_named               :string
#  ikcon_contract_time              :string
#  ikcon_exec_active                :string
#  ikcon_exec_address               :string
#  ikcon_exec_bank_details          :string
#  ikcon_exec_based_doc             :string
#  ikcon_exec_chief_name            :string
#  ikcon_exec_chief_name_sign       :string
#  ikcon_exec_chief_position        :string
#  ikcon_exec_chief_position_sign   :string
#  ikcon_exec_name                  :string
#  ikcon_exec_named                 :string
#  ikcon_inspection_period          :string
#  ikcon_name_product               :string
#  ikcon_registration_city          :string
#  ikcon_registration_date          :datetime
#  ikcon_registration_num           :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  certificate_id                   :bigint(8)
#
# Indexes
#
#  index_ikcontracts_on_certificate_id  (certificate_id)
#

# model IK contracts
class Ikcontract < ApplicationRecord
  belongs_to :certificate, inverse_of: :ikcontract
  validates :certificate_id, uniqueness: true
  validates :ikcon_registration_num, :ikcon_registration_date, presence: true
end
