# frozen_string_literal: true

# == Schema Information
#
# Table name: protocols
#
#  id                       :bigint(8)        not null, primary key
#  solution_proposal_id     :bigint(8)
#  prot_date_from           :datetime
#  prot_applic_name_product :text
#  prot_applic_code_okp     :string
#  prot_applic_code_tn_ved  :string
#  prot_origin_cert         :string
#  prot_info_product        :string
#  prot_date_issue_product  :datetime
#  prot_shelf_life          :string
#  prot_info_box            :string
#  prot_label_product       :string
#  prot_regulations_product :string
#  prot_evaluation_product  :text
#  prot_requirement_test    :string
#  prot_list_indicators     :text
#  prot_conclusion          :string
#  prot_expert              :string
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  prot_manuf_name          :string
#  prot_manuf_address       :string
#  prot_manuf_postcode      :string
#

class Protocol < ApplicationRecord
  belongs_to :solution_proposal
  validates :prot_date_from, presence: true
end
