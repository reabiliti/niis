# frozen_string_literal: true

FactoryBot.define do
  factory :protocol do
    applic_code_okp { 'applic_code_okp' }
    applic_code_tn_ved { 'applic_code_tn_ved' }
    applic_name_product { 'applic_name_product' }
    conclusion { 'conclusion' }
    date_from { Date.new }
    date_issue_product { Date.new }
    evaluation_product { 'evaluation_product' }
    expert { 'expert' }
    info_box { 'info_box' }
    info_product { 'info_product' }
    label_product { 'label_product' }
    list_indicators { 'list_indicators' }
    manuf_address { 'manuf_address' }
    manuf_name { 'manuf_name' }
    manuf_postcode { 'manuf_postcode' }
    manuf_regulations { 'manuf_regulations' }
    origin_cert { 'origin_cert' }
    requirement_test { 'requirement_test' }
    shelf_life { 'shelf_life' }
    solution_proposal
  end
end
