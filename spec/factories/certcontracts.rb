# frozen_string_literal: true

FactoryBot.define do
  factory :certcontract do
    applic_active { 'applic_active' }
    applic_address { 'applic_address' }
    applic_bank_details { 'applic_bank_details' }
    applic_based_doc { 'applic_based_doc' }
    applic_chief_name { 'applic_chief_name' }
    applic_chief_name_sign { 'applic_chief_name_sign' }
    applic_chief_position { 'applic_chief_position' }
    applic_chief_position_sign { 'applic_chief_position_sign' }
    applic_name { 'applic_name' }
    applic_name_product { 'applic_name_product' }
    applic_named { 'applic_named' }
    applic_postcode { 'applic_postcode' }
    date_expiry { Date.new }
    date_from { Date.new }
    org_active { 'org_active' }
    org_address { 'org_address' }
    org_bank_details { 'org_bank_details' }
    org_based_doc { 'org_based_doc' }
    org_chief_name { 'org_chief_name' }
    org_chief_name_sign { 'org_chief_name_sign' }
    org_chief_position { 'org_chief_position' }
    org_chief_position_sign { 'org_chief_position_sign' }
    org_name { 'org_name' }
    org_named { 'org_named' }
    org_postcode { 'org_postcode' }
    os_city { 'os_city' }
    price_work { 'price_work' }
    price_work_total { 'price_work_total' }
    registration_date { Date.new }
    registration_num { 'registration_num' }
    proposal
  end
end
