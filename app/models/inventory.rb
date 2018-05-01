# frozen_string_literal: true

# Inventory document
class Inventory < ApplicationRecord
  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :inv_date_from, presence: true
end
