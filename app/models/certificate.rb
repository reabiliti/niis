class Certificate < ApplicationRecord
  belongs_to :solution
  has_one :permission, dependent: :destroy
  has_one :ikcontract, dependent: :destroy, validate: true

  def self.search(cer_search)
    cer_search ? (where('cer_number LIKE ? OR cer_blank_number LIKE ?', "%#{cer_search}%", "%#{cer_search}%")) : all
  end

end
