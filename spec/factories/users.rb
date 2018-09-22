# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    password { 'Password1*' }
    password_confirmation { 'Password1*' }
    salt { 'ExqpVWiDcK2vGfeRjqTx' }
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt('password', salt) }
    remember_me_token { false }
    remember_me_token_expires_at { nil }
    role { ROLES.sample }
  end
end
