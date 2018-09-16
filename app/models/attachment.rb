# frozen_string_literal: true

# == Schema Information
#
# Table name: attachments
#
#  id               :bigint(8)        not null, primary key
#  certificate_id   :bigint(8)
#  att_blank_num    :string
#  att_code_okp     :string
#  att_code_tn_ved  :string
#  att_name_product :string
#  att_manuf_name   :string
#  att_regulations  :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Attachment < ApplicationRecord
  belongs_to :certificate
  validates :att_blank_num, uniqueness: true, presence: true
end
