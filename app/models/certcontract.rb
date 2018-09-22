# frozen_string_literal: true

# == Schema Information
#
# Table name: certcontracts
#
#  id                         :bigint(8)        not null, primary key
#  applic_active              :string
#  applic_address             :string
#  applic_bank_details        :string
#  applic_based_doc           :string
#  applic_chief_name          :string
#  applic_chief_name_sign     :string
#  applic_chief_position      :string
#  applic_chief_position_sign :string
#  applic_name                :string
#  applic_name_product        :string
#  applic_named               :string
#  applic_postcode            :string
#  date_expiry                :datetime
#  date_from                  :datetime
#  org_active                 :string
#  org_address                :string
#  org_bank_details           :string
#  org_based_doc              :string
#  org_chief_name             :string
#  org_chief_name_sign        :string
#  org_chief_position         :string
#  org_chief_position_sign    :string
#  org_name                   :string
#  org_named                  :string
#  org_postcode               :string
#  os_city                    :string
#  price_work                 :string
#  price_work_total           :string
#  registration_date          :datetime
#  registration_num           :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  proposal_id                :bigint(8)
#
# Indexes
#
#  index_certcontracts_on_proposal_id  (proposal_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposal_id => proposals.id)
#

# Model certificate contracs
class Certcontract < ApplicationRecord
  include InitializeObject

  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :registration_num,
            :registration_date,
            :date_from,
            :date_expiry,
            presence: true
end
