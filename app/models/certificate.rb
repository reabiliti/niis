class Certificate < ApplicationRecord
  belongs_to :solution, inverse_of: :certificate
  validates :solution_id, :cert_blank_num, uniqueness: true
  has_one :permission, dependent: :destroy, inverse_of: :certificate
  has_one :ikcontract, dependent: :destroy, inverse_of: :certificate
  has_many :attachments, dependent: :destroy, inverse_of: :certificate

  def self.search(cer_search)
    cer_search ? (where('cer_number LIKE ? OR cer_blank_number LIKE ?', "%#{cer_search}%", "%#{cer_search}%")) : all
  end

end
