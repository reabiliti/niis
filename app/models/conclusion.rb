class Conclusion < ApplicationRecord
  belongs_to :solution_proposal
  has_one :solution, dependent: :destroy
end
