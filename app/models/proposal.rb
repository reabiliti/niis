# frozen_string_literal: true

# == Schema Information
#
# Table name: proposals
#
#  id                     :bigint(8)        not null, primary key
#  applic_address         :string
#  applic_bank_detail     :text
#  applic_chief_name      :string
#  applic_chief_position  :string
#  applic_code_okato      :string
#  applic_code_okonh      :string
#  applic_code_okp        :string
#  applic_code_okpo       :string
#  applic_code_okved      :string
#  applic_code_tn_ved     :string
#  applic_email           :string
#  applic_fax             :string
#  applic_from_issue      :string
#  applic_inn             :string
#  applic_kpp             :string
#  applic_name            :string
#  applic_name_product    :text
#  applic_phone           :string
#  applic_postcode        :string
#  applic_reg_doc         :string
#  applic_type_own        :string
#  cert_system            :string
#  date_from              :datetime
#  manuf_add_info         :text
#  manuf_address          :string
#  manuf_chief_accountant :string
#  manuf_chief_name       :string
#  manuf_chief_position   :string
#  manuf_code_okato       :string
#  manuf_code_okonh       :string
#  manuf_code_okpo        :string
#  manuf_code_okved       :string
#  manuf_count_sort_cert  :string
#  manuf_doc              :string
#  manuf_group_complexity :string
#  manuf_inn              :string
#  manuf_list_doc         :text
#  manuf_name             :string
#  manuf_postcode         :string
#  manuf_regulations      :string
#  manuf_scheme_cert      :string
#  manuf_type_own         :string
#  number                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_proposals_on_id  (id)
#

# This model proposals
class Proposal < ApplicationRecord
  has_one :solution_proposal, dependent: :destroy
  has_one :certcontract, dependent: :destroy
  has_one :inventory, dependent: :destroy
  validates :number, uniqueness: true
  validates :date_from, :number, presence: true

  def self.search(search, page)
    return page(page).order(created_at: :desc) unless search

    where('number LIKE ?', "%#{search}%").page(page).order(created_at: :desc)
  end
end
