# frozen_string_literal: true

FactoryBot.define do
  factory :setting do
    at_x { 0 }
    at_y { 0 }
    name { Faker::Book.author }
    org_address { Faker::Address.full_address }
    org_based_doc { 'org based doc' }
    org_chief_accountant { 'chief accountant' }
    org_chief_name { Faker::Book.author }
    org_chief_position { 'org chief position' }
    org_name { 'Organization' }
    org_phone { Faker::PhoneNumber.cell_phone }
    org_postcode { Faker::Address.postcode }
    os_address { Faker::Address.full_address }
    os_based_doc { 'OS based doc' }
    os_chief_name { Faker::Book.author }
    os_chief_position { 'chief position' }
    os_city { Faker::Address.city }
    os_name { 'OS name' }
    os_postcode { Faker::Address.postcode }
    os_registration_date { Date.new }
    os_registration_num { 'registration number' }
  end
end
