# frozen_string_literal: true

# This model proposals
class Proposal < ApplicationRecord
  has_one :solution_proposal, dependent: :destroy
  has_one :certcontract, dependent: :destroy
  has_one :inventory, dependent: :destroy
  validates :prop_number, uniqueness: true
  validates :prop_date_from, :prop_number, presence: true

  def self.search(search, page)
    return page(page).order('prop_number DESC') unless search
    where('prop_number LIKE ?', "%#{search}%").page(page).order('prop_number DESC')
  end
end
