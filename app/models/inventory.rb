# frozen_string_literal: true

# == Schema Information
#
# Table name: inventories
#
#  id             :bigint(8)        not null, primary key
#  date_from      :datetime
#  exec_name      :string
#  inv_chief_name :string
#  inv_date_from  :datetime
#  inv_exec_name  :string
#  inv_list_doc   :string
#  inv_list_page  :string
#  list_doc       :string
#  list_page      :string
#  os_chief_name  :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  proposal_id    :bigint(8)
#
# Indexes
#
#  index_inventories_on_proposal_id  (proposal_id)
#
# Foreign Keys
#
#  fk_rails_...  (proposal_id => proposals.id)
#

# Inventory document
class Inventory < ApplicationRecord
  belongs_to :proposal
  validates :proposal_id, uniqueness: true
  validates :inv_date_from, presence: true
end
