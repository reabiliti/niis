# frozen_string_literal: true

# == Schema Information
#
# Table name: inventories
#
#  id             :bigint(8)        not null, primary key
#  proposal_id    :bigint(8)
#  inv_date_from  :datetime
#  inv_list_doc   :string
#  inv_list_page  :string
#  inv_exec_name  :string
#  inv_chief_name :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

# Inventory document
class Inventory < ApplicationRecord
  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :inv_date_from, presence: true
end
