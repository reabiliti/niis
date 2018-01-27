class Certificate < ApplicationRecord

  def self.search(cer_search)
    cer_search ? (where('cer_number LIKE ? OR cer_blank_number LIKE ?', "%#{cer_search}%", "%#{cer_search}%")) : all
  end

  validates :cer_blank_number, presence: true,
                               uniqueness: true,
                               length: { minimum: 7 }
end
