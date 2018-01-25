class Certificate < ApplicationRecord

  validates :cer_blank_number, presence: true,
                               length: { minimum: 7 }
end
