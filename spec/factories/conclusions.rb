# frozen_string_literal: true

FactoryBot.define do
  factory :conclusion do
    add_info { 'add_info' }
    applic_code_okp { 'applic_code_okp' }
    applic_code_tn_ved { 'applic_code_tn_ved' }
    applic_name_product { 'applic_name_product' }
    attachment { 'attachment' }
    cert_expiry_date { Date.new }
    conformity { 'conformity' }
    date_from { Date.new }
    desc_scheme_cert { 'desc_scheme_cert' }
    expert { 'expert' }
    list_doc_product { 'list_doc_product' }
    manuf_address { 'manuf_address' }
    manuf_doc { 'manuf_doc' }
    manuf_name { 'manuf_name' }
    manuf_postcode { 'manuf_postcode' }
    manuf_regulations { 'manuf_regulations' }
    may_be_issued { 'may_be_issued' }
    number { 'number' }
    sign_date { Date.new }
    test_report { 'test_report' }
    solution_proposal
  end
end
