# frozen_string_literal: true

class Protocol < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :protocols
  validates :prot_date_from, presence: true
end
