# frozen_string_literal: true

# == Schema Information
#
# Table name: solution_proposals
#
#  id                          :bigint(8)        not null, primary key
#  proposal_id                 :bigint(8)
#  solprop_number              :string
#  solprop_date_from           :datetime
#  solprop_solution            :string
#  solprop_applic_name_product :text
#  solprop_applic_code_okp     :string
#  solprop_applic_code_tn_ved  :string
#  solprop_manuf_address       :string
#  solprop_manuf_postcode      :string
#  solprop_manuf_doc           :string
#  solprop_regulations         :string
#  solprop_desc_scheme_cert    :string
#  solprop_test_lab            :string
#  solprop_sampling            :string
#  solprop_list_doc_product    :string
#  solprop_basis_work          :string
#  solprop_add_info            :string
#  solprop_chief_name          :string
#  solprop_chief_org           :string
#  solprop_expert              :string
#  solprop_executor            :string
#  solprop_applic_name         :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  solprop_manuf_name          :text
#  solprop_manuf_list_doc      :text
#  number                      :string
#  date_from                   :datetime
#  solution                    :string
#  applic_name_product         :text
#  applic_code_okp             :string
#  applic_code_tn_ved          :string
#  manuf_address               :string
#  manuf_postcode              :string
#  manuf_doc                   :string
#  manuf_regulations           :string
#  desc_scheme_cert            :string
#  test_lab                    :string
#  sampling                    :string
#  list_doc_product            :string
#  basis_work                  :string
#  add_info                    :string
#  chief_name                  :string
#  chief_org                   :string
#  expert                      :string
#  executor                    :string
#  applic_sign                 :boolean          default(FALSE)
#  applic_name                 :string
#  manuf_name                  :text
#  manuf_list_doc              :text
#

class SolutionProposal < ApplicationRecord
  include InitializeObject

  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :number, :date_from, presence: true
  has_many :protocols, dependent: :destroy
  has_one :conclusion, dependent: :destroy
end
