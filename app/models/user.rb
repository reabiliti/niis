# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                           :bigint(8)        not null, primary key
#  email                        :string           not null
#  name                         :string           not null
#  remember_me_token_expires_at :datetime
#  remember_me_token            :string
#  salt                         :string           not null
#  crypted_password             :string           not null
#  role                         :string           not null
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 3 }
  validates :password, confirmation: true
  validates :email, uniqueness: { case_sensitive: false }, email_format: { message: 'has invalid format' }
  validates :name, :email, presence: true
  validates :role, presence: true, inclusion: { in: ROLES }
end
