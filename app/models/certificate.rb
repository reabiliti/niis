# frozen_string_literal: true

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
