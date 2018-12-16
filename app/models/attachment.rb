# frozen_string_literal: true

# == Schema Information
#
# Table name: attachments
#
#  id               :bigint(8)        not null, primary key
#  att_blank_num    :string
#  att_code_okp     :string
#  att_code_tn_ved  :string
#  att_manuf_name   :string
#  att_name_product :string
#  att_regulations  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  certificate_id   :bigint(8)
#
# Indexes
#
#  index_attachments_on_certificate_id  (certificate_id)
#

class Attachment < ApplicationRecord
  include InitializeObject

  belongs_to :certificate
  validates :att_blank_num, uniqueness: true, presence: true
end
