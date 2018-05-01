# frozen_string_literal: true

class Attachment < ApplicationRecord
  belongs_to :certificate
  validates :att_blank_num, uniqueness: true, presence: true
end
