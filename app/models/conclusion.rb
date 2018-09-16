# frozen_string_literal: true

# == Schema Information
#
# Table name: conclusions
#
#  id                          :bigint(8)        not null, primary key
#  conc_solution_proposal_num  :string
#  conc_solution_proposal_date :datetime
#  conc_name_product           :text
#  conc_code_okp               :string
#  conc_code_tn_ved            :string
#  conc_manuf_name             :string
#  conc_manuf_address          :string
#  conc_manuf_postcode         :string
#  conc_manuf_doc              :string
#  conc_manuf_regulations      :string
#  conc_desc_scheme_cert       :text
#  conc_test_report            :text
#  conc_list_doc               :string
#  conc_conformity             :string
#  conc_may_be_issued          :string
#  conc_cert_expiry_date       :datetime
#  conc_add_info               :text
#  conc_attachment             :string
#  conc_expert                 :string
#  conc_sign_date              :datetime
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  solution_proposal_id        :bigint(8)
#

# Model conclusions
class Conclusion < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :conclusion
  validates :solution_proposal_id, uniqueness: true
  validates :conc_solution_proposal_num, :conc_solution_proposal_date,
            :conc_cert_expiry_date, :conc_sign_date, presence: true

  has_one :solution, dependent: :destroy, inverse_of: :conclusion
end
