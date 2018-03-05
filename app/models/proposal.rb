class Proposal < ApplicationRecord
  has_one :solution_proposal, dependent: :destroy, inverse_of: :proposal
  has_one :certcontract, dependent: :destroy
  has_one :inventory, dependent: :destroy
  validates :prop_number, uniqueness: true
  validates :prop_date_from, :prop_number, presence: true

  def self.search(search, page)
    if search
      where('prop_number likE ?', "%#{search}%").paginate(page: page, per_page: 10).order('prop_number DESC')
    else
      paginate(page: page, per_page: 10).order('prop_number DESC')
    end
  end
end
