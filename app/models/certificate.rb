class Certificate < ApplicationRecord
  belongs_to :solution, inverse_of: :certificate
  validates_uniqueness_of :solution_id
  has_one :permission, dependent: :destroy, inverse_of: :certificate
  has_one :ikcontract, dependent: :destroy, inverse_of: :certificate

  def self.search(cer_search)
    cer_search ? (where('cer_number LIKE ? OR cer_blank_number LIKE ?', "%#{cer_search}%", "%#{cer_search}%")) : all
  end

end
