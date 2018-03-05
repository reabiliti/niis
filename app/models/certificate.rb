class Certificate < ApplicationRecord
  belongs_to :solution, inverse_of: :certificates
  validates :cert_blank_num, uniqueness: true
  validates :cert_expiry_date, :cert_registration_date, :cert_registration_num, :cert_blank_num,
            presence: true
  has_one :permission, dependent: :destroy, inverse_of: :certificate
  has_one :ikcontract, dependent: :destroy, inverse_of: :certificate
  has_many :attachments, dependent: :destroy, inverse_of: :certificate
end
