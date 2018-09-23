# frozen_string_literal: true

# == Schema Information
#
# Table name: conclusions
#
#  id                   :bigint(8)        not null, primary key
#  add_info             :text
#  applic_code_okp      :string
#  applic_code_tn_ved   :string
#  applic_name_product  :text
#  attachment           :string
#  cert_expiry_date     :datetime
#  conformity           :string
#  date_from            :datetime
#  desc_scheme_cert     :text
#  expert               :string
#  list_doc_product     :string
#  manuf_address        :string
#  manuf_doc            :string
#  manuf_name           :string
#  manuf_postcode       :string
#  manuf_regulations    :string
#  may_be_issued        :string
#  number               :string
#  sign_date            :datetime
#  test_report          :text
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  solution_proposal_id :bigint(8)
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
  include InitializeObject

  belongs_to :solution_proposal
  has_one :solution, dependent: :destroy

  validates :solution_proposal_id, uniqueness: true
  validates :number, :date_from, :cert_expiry_date, :sign_date, presence: true
end
