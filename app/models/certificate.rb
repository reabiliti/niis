# frozen_string_literal: true

# == Schema Information
#
# Table name: certificates
#
#  id                          :bigint(8)        not null, primary key
#  cert_add_info               :string
#  cert_applic_address         :string
#  cert_applic_inn             :string
#  cert_applic_name            :string
#  cert_applic_phone           :string
#  cert_applic_postcode        :string
#  cert_blank_num              :string
#  cert_chief_org              :string
#  cert_code_okp               :string
#  cert_code_tn_ved            :string
#  cert_expert                 :string
#  cert_expiry_date            :datetime
#  cert_manuf_address          :string
#  cert_manuf_doc              :string
#  cert_manuf_inn              :string
#  cert_manuf_name             :string
#  cert_manuf_postcode         :string
#  cert_manuf_regulations      :string
#  cert_name_product           :string
#  cert_name_product_size_font :integer
#  cert_place_marking          :string
#  cert_registration_date      :datetime
#  cert_registration_num       :string
#  cert_test_report            :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  solution_id                 :bigint(8)
#
# Indexes
#
#  index_certificates_on_solution_id  (solution_id)
#

# Model certificates
class Certificate < ApplicationRecord
  belongs_to :solution, inverse_of: :certificates
  validates :cert_blank_num, uniqueness: true
  validates :cert_expiry_date, :cert_registration_date, :cert_registration_num,
            :cert_blank_num, :cert_applic_name, :cert_manuf_name, presence: true
  has_one :permission, dependent: :destroy
  has_one :ikcontract, dependent: :destroy
  has_many :attachments, dependent: :destroy
end
