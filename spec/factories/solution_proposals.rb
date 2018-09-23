# frozen_string_literal: true

FactoryBot.define do
  factory :solution_proposal do
    add_info { 'add_info' }
    applic_code_okp { 'applic_code_okp' }
    applic_code_tn_ved { 'applic_code_tn_ved' }
    applic_name { 'applic_name' }
    applic_name_product { 'applic_name_product' }
    applic_sign { true }
    basis_work { 'basis_work' }
    date_from { Date.new }
    desc_scheme_cert { 'desc_scheme_cert' }
    executor { 'executor' }
    expert { 'expert' }
    list_doc_product { 'list_doc_product' }
    manuf_address { 'manuf_address' }
    manuf_doc { 'manuf_doc' }
    manuf_list_doc { 'manuf_list_doc' }
    manuf_name { 'manuf_name' }
    manuf_postcode { 'manuf_postcode' }
    manuf_regulations { 'manuf_regulations' }
    number { 'number' }
    os_chief_name { 'os_chief_name' }
    os_chief_position { 'os_chief_position' }
    sampling { 'sampling' }
    decision_was_made { 'solution' }
    test_lab { 'test_lab' }
    proposal
  end
end
