# frozen_string_literal: true

class Protocol < ApplicationRecord
  belongs_to :solution_proposal
  validates :prot_date_from, presence: true
end
