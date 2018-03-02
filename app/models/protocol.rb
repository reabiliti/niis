class Protocol < ApplicationRecord
  belongs_to :solution_proposal, inverse_of: :protocols
end
