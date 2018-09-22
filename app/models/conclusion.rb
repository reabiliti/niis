# frozen_string_literal: true

# == Schema Information
#
# Table name: conclusions
#
#  id                          :bigint(8)        not null, primary key
#  add_info                    :text
#  attachment                  :string
#  cert_expiry_date            :datetime
#  code_okp                    :string
#  code_tn_ved                 :string
#  conc_add_info               :text
#  conc_attachment             :string
#  conc_cert_expiry_date       :datetime
#  conc_code_okp               :string
#  conc_code_tn_ved            :string
#  conc_conformity             :string
#  conc_desc_scheme_cert       :text
#  conc_expert                 :string
#  conc_list_doc               :string
#  conc_manuf_address          :string
#  conc_manuf_doc              :string
#  conc_manuf_name             :string
#  conc_manuf_postcode         :string
#  conc_manuf_regulations      :string
#  conc_may_be_issued          :string
#  conc_name_product           :text
#  conc_sign_date              :datetime
#  conc_solution_proposal_date :datetime
#  conc_solution_proposal_num  :string
#  conc_test_report            :text
#  conformity                  :string
#  date_from                   :datetime
#  desc_scheme_cert            :text
#  expert                      :string
#  list_doc_product            :string
#  manuf_address               :string
#  manuf_doc                   :string
#  manuf_name                  :string
#  manuf_postcode              :string
#  manuf_regulations           :string
#  may_be_issued               :string
#  name_product                :text
#  number                      :string
#  sign_date                   :datetime
#  test_report                 :text
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  solution_proposal_id        :bigint(8)
#
# Indexes
#
#  index_conclusions_on_solution_proposal_id  (solution_proposal_id)
#
# Foreign Keys
#
#  fk_rails_...  (solution_proposal_id => solution_proposals.id)
#

# Model conclusions
class Conclusion < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :conclusion
  validates :solution_proposal_id, uniqueness: true
  validates :conc_solution_proposal_num, :conc_solution_proposal_date,
            :conc_cert_expiry_date, :conc_sign_date, presence: true

  has_one :solution, dependent: :destroy, inverse_of: :conclusion
end
