# frozen_string_literal: true

# == Schema Information
#
# Table name: protocols
#
#  id                   :bigint(8)        not null, primary key
#  applic_code_okp      :string
#  applic_code_tn_ved   :string
#  applic_name_product  :text
#  conclusion           :string
#  date_from            :datetime
#  date_issue_product   :datetime
#  evaluation_product   :text
#  expert               :string
#  info_box             :string
#  info_product         :string
#  label_product        :string
#  list_indicators      :text
#  manuf_address        :string
#  manuf_name           :string
#  manuf_postcode       :string
#  manuf_regulations    :string
#  origin_cert          :string
#  requirement_test     :string
#  shelf_life           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  solution_proposal_id :bigint(8)
#
# Indexes
#
#  index_protocols_on_solution_proposal_id  (solution_proposal_id)
#
# Foreign Keys
#
#  fk_rails_...  (solution_proposal_id => solution_proposals.id)
#

# This model protocols after solution proposal
class Protocol < ApplicationRecord
  include InitializeObject

  belongs_to :solution_proposal
  validates :date_from, presence: true
end
