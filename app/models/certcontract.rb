# frozen_string_literal: true

# == Schema Information
#
# Table name: certcontracts
#
#  id                               :bigint(8)        not null, primary key
#  proposal_id                      :bigint(8)
#  cecon_exec_chief_name_sign       :string
#  cecon_registration_date          :datetime
#  cecon_registration_num           :string
#  cecon_registration_city          :string
#  cecon_exec_name                  :string
#  cecon_exec_named                 :string
#  cecon_exec_chief_position        :string
#  cecon_exec_chief_name            :string
#  cecon_exec_active                :string
#  cecon_exec_based_doc             :string
#  cecon_client_name                :string
#  cecon_client_named               :string
#  cecon_client_chief_position      :string
#  cecon_client_chief_name          :string
#  cecon_client_active              :string
#  cecon_client_based_doc           :string
#  cecon_name_product               :string
#  cecon_date_from                  :datetime
#  cecon_date_expiry                :datetime
#  cecon_exec_address               :string
#  cecon_exec_bank_details          :string
#  cecon_client_address             :string
#  cecon_client_bank_details        :string
#  cecon_exec_chief_position_sign   :string
#  cecon_client_chief_position_sign :string
#  cecon_client_chief_name_sign     :string
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  cecon_price_work                 :string
#  cecon_price_work_total           :string
#

# Model certificate contracs
class Certcontract < ApplicationRecord
  include InitializeObject

  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :cecon_registration_num, :cecon_registration_date, :cecon_date_from, :cecon_date_expiry, presence: true
end
