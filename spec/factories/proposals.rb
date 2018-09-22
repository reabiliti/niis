# frozen_string_literal: true

FactoryBot.define do
  sequence :number do |n|
    "number#{n}"
  end

  factory :proposal do
    applic_address { 'applic_address' }
    applic_bank_detail { 'applic_bank_detail' }
    applic_chief_name { 'applic_chief_name' }
    applic_chief_position { 'applic_chief_position' }
    applic_code_okato { 'applic_code_okato' }
    applic_code_okonh { 'applic_code_okonh' }
    applic_code_okp { 'applic_code_okp' }
    applic_code_okpo { 'applic_code_okpo' }
    applic_code_okved { 'applic_code_okved' }
    applic_code_tn_ved { 'applic_code_tn_ved' }
    applic_email { 'applic_email' }
    applic_fax { 'applic_fax' }
    applic_from_issue { 'applic_from_issue' }
    applic_inn { 'applic_inn' }
    applic_kpp { 'applic_kpp' }
    applic_name { 'applic_name' }
    applic_name_product { 'applic_name_product' }
    applic_phone { 'applic_phone' }
    applic_postcode { 'applic_postcode' }
    applic_reg_doc { 'applic_reg_doc' }
    applic_type_own { 'applic_type_own' }
    cert_system { 'cert_system' }
    date_from { Date.new }
    manuf_add_info { 'manuf_add_info' }
    manuf_address { 'manuf_address' }
    manuf_chief_accountant { 'manuf_chief_accountant' }
    manuf_chief_name { 'manuf_chief_name' }
    manuf_chief_position { 'manuf_chief_position' }
    manuf_code_okato { 'manuf_code_okato' }
    manuf_code_okonh { 'manuf_code_okonh' }
    manuf_code_okpo { 'manuf_code_okpo' }
    manuf_code_okved { 'manuf_code_okved' }
    manuf_count_sort_cert { 'manuf_count_sort_cert' }
    manuf_doc { 'manuf_doc' }
    manuf_group_complexity { 'manuf_group_complexity' }
    manuf_inn { 'manuf_inn' }
    manuf_list_doc { 'manuf_list_doc' }
    manuf_name { 'manuf_name' }
    manuf_postcode { 'manuf_postcode' }
    manuf_regulations { 'manuf_regulations' }
    manuf_scheme_cert { 'manuf_scheme_cert' }
    manuf_type_own { 'manuf_type_own' }
    number { generate :number }
  end
end
