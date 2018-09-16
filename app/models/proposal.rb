# frozen_string_literal: true

# == Schema Information
#
# Table name: proposals
#
#  id                          :bigint(8)        not null, primary key
#  prop_number                 :string
#  prop_date_from              :datetime
#  prop_cert_system            :string
#  prop_applic_name            :string
#  prop_applic_reg_doc         :string
#  prop_applic_address         :string
#  prop_applic_bank_detail     :text
#  prop_applic_phone           :string
#  prop_applic_fax             :string
#  prop_applic_email           :string
#  prop_applic_code_okato      :string
#  prop_applic_type_own        :string
#  prop_applic_code_okonh      :string
#  prop_applic_code_okved      :string
#  prop_applic_code_okpo       :string
#  prop_applic_chief           :string
#  prop_applic_name_product    :text
#  prop_applic_from_issue      :string
#  prop_manuf_name             :string
#  prop_manuf_address          :string
#  prop_manuf_doc              :string
#  prop_manuf_code_okato       :string
#  prop_manuf_type_own         :string
#  prop_manuf_code_okonh       :string
#  prop_manuf_code_okved       :string
#  prop_manuf_code_okpo        :string
#  prop_manuf_regulations      :string
#  prop_manuf_list_doc         :text
#  prop_manuf_add_info         :text
#  prop_manuf_chief_org        :string
#  prop_manuf_chief_accountant :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  prop_applic_postcode        :string
#  prop_applic_inn             :string
#  prop_applic_kpp             :string
#  prop_applic_code_okp        :string
#  prop_applic_code_tn_ved     :string
#  prop_manuf_postcode         :string
#  prop_manuf_inn              :string
#  prop_manuf_scheme_cert      :string
#  prop_manuf_count_sort_cert  :string
#  prop_manuf_group_complexity :string
#  number                      :string
#  date_from                   :datetime
#  cert_system                 :string
#  applic_name                 :string
#  applic_reg_doc              :string
#  applic_address              :string
#  applic_postcode             :string
#  applic_inn                  :string
#  applic_kpp                  :string
#  applic_code_okp             :string
#  applic_code_tn_ved          :string
#  applic_bank_detail          :text
#  applic_phone                :string
#  applic_fax                  :string
#  applic_email                :string
#  applic_code_okato           :string
#  applic_type_own             :string
#  applic_code_okonh           :string
#  applic_code_okved           :string
#  applic_code_okpo            :string
#  applic_chief                :string
#  applic_name_product         :text
#  applic_from_issue           :string
#  manuf_name                  :string
#  manuf_address               :string
#  manuf_postcode              :string
#  manuf_inn                   :string
#  manuf_doc                   :string
#  manuf_code_okato            :string
#  manuf_type_own              :string
#  manuf_code_okonh            :string
#  manuf_code_okved            :string
#  manuf_code_okpo             :string
#  manuf_regulations           :string
#  manuf_list_doc              :text
#  manuf_add_info              :text
#  manuf_chief_org             :string
#  manuf_chief_accountant      :string
#  manuf_scheme_cert           :string
#  manuf_count_sort_cert       :string
#  manuf_group_complexity      :string
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
