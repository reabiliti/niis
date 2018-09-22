# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                           :bigint(8)        not null, primary key
#  crypted_password             :string           not null
#  email                        :string           not null
#  name                         :string           not null
#  remember_me_token            :string
#  remember_me_token_expires_at :datetime
#  role                         :string           not null
#  salt                         :string           not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email)
#

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false }, email_format: { message: 'has invalid format' }
  validates :name, :email, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
end
