# frozen_string_literal: true

# == Schema Information
#
# Table name: solutions
#
#  id                         :bigint(8)        not null, primary key
#  conclusion_id              :bigint(8)
#  sol_number                 :string
#  sol_delivery               :string
#  sol_solution_proposal_num  :string
#  sol_solution_proposal_date :datetime
#  sol_name_product           :text
#  sol_code_okp               :string
#  sol_code_tn_ved            :string
#  sol_manuf_name             :string
#  sol_manuf_address          :string
#  sol_manuf_postcode         :string
#  sol_manuf_doc              :string
#  sol_manuf_regulations      :string
#  sol_desc_scheme_cert       :text
#  sol_test_report            :text
#  sol_list_doc               :string
#  sol_conclusion_date        :datetime
#  sol_cert_expiry_date       :datetime
#  sol_place_marking          :string
#  sol_inspection_period      :string
#  sol_inspection_method      :string
#  sol_inspection_work_basis  :string
#  sol_add_info               :text
#  sol_chief_name             :string
#  sol_chief_org              :string
#  sol_expert                 :string
#  sol_executor               :string
#  sol_applic_sign            :boolean          default(FALSE), not null
#  sol_applic_name            :string
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  sol_date_from              :datetime
#

class Solution < ApplicationRecord
  belongs_to :conclusion, inverse_of: :solution
  validates :conclusion_id, uniqueness: true
  validates :sol_number, :sol_date_from, :sol_solution_proposal_date,
            :sol_solution_proposal_num, :sol_cert_expiry_date,
            :sol_conclusion_date, presence: true

  has_many :certificates, dependent: :destroy, inverse_of: :solution
end
