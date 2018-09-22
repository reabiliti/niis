# frozen_string_literal: true

# == Schema Information
#
# Table name: protocols
#
#  id                       :bigint(8)        not null, primary key
#  prot_applic_code_okp     :string
#  prot_applic_code_tn_ved  :string
#  prot_applic_name_product :text
#  prot_conclusion          :string
#  prot_date_from           :datetime
#  prot_date_issue_product  :datetime
#  prot_evaluation_product  :text
#  prot_expert              :string
#  prot_info_box            :string
#  prot_info_product        :string
#  prot_label_product       :string
#  prot_list_indicators     :text
#  prot_manuf_address       :string
#  prot_manuf_name          :string
#  prot_manuf_postcode      :string
#  prot_origin_cert         :string
#  prot_regulations_product :string
#  prot_requirement_test    :string
#  prot_shelf_life          :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  solution_proposal_id     :bigint(8)
#
# Indexes
#
#  index_protocols_on_solution_proposal_id  (solution_proposal_id)
#

class Protocol < ApplicationRecord
  belongs_to :solution_proposal
  validates :prot_date_from, presence: true
end
