class Attachment < ApplicationRecord
  belongs_to :certificate
  validates :att_blank_num, uniqueness: true
end
