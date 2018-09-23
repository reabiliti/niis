# frozen_string_literal: true

# == Schema Information
#
# Table name: solution_proposals
#
#  id                  :bigint(8)        not null, primary key
#  add_info            :string
#  applic_code_okp     :string
#  applic_code_tn_ved  :string
#  applic_name         :string
#  applic_name_product :text
#  applic_sign         :boolean          default(FALSE)
#  basis_work          :string
#  date_from           :datetime
#  decision_was_made   :string
#  desc_scheme_cert    :string
#  executor            :string
#  expert              :string
#  list_doc_product    :string
#  manuf_address       :string
#  manuf_doc           :string
#  manuf_list_doc      :text
#  manuf_name          :text
#  manuf_postcode      :string
#  manuf_regulations   :string
#  number              :string
#  os_chief_name       :string
#  os_chief_position   :string
#  sampling            :string
#  solution            :string
#  test_lab            :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  proposal_id         :bigint(8)
#
# Indexes
#
#  index_solution_proposals_on_id           (id)
#  index_solution_proposals_on_proposal_id  (proposal_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposal_id => proposals.id)
#

# This model solutions proposals after proposal
class SolutionProposal < ApplicationRecord
  include InitializeObject

  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :number, :date_from, presence: true
  has_many :protocols, dependent: :destroy
  has_one :conclusion, dependent: :destroy
end
