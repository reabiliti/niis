# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180222120925) do

  create_table "certificates", force: :cascade do |t|
    t.string "cer_number"
    t.string "cer_blank_number"
    t.datetime "cer_validity_from"
    t.datetime "cer_validity_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "cer_product_name"
    t.string "cer_code_okp"
    t.string "cer_code_tn_ved"
    t.text "cer_regulation"
    t.text "cer_manufacturer"
    t.text "cer_certificate_issued"
    t.text "cer_based"
    t.text "cer_more_info"
    t.string "cer_org_chief"
    t.string "cer_org_expert"
    t.integer "setting_id"
    t.index ["id"], name: "index_certificates_on_id"
    t.index ["setting_id"], name: "index_certificates_on_setting_id"
  end

  create_table "conclusions", force: :cascade do |t|
    t.string "conc_solution_proposal_num"
    t.datetime "conc_solution_proposal_date"
    t.string "conc_contract_num"
    t.datetime "conc_contract_date"
    t.string "conc_directive_num"
    t.datetime "conc_directive_date"
    t.text "conc_name_product"
    t.string "conc_code_okp"
    t.string "conc_code_tn_ved"
    t.string "conc_manuf_name"
    t.string "conc_manuf_address"
    t.string "conc_manuf_postcode"
    t.string "conc_manuf_doc"
    t.string "conc_manuf_regulations"
    t.text "conc_desc_scheme_cert"
    t.text "conc_test_report"
    t.string "conc_list_doc"
    t.string "conc_conformity"
    t.string "conc_may_be_issued"
    t.datetime "conc_cert_expiry_date"
    t.text "conc_add_info"
    t.string "conc_attachment"
    t.string "conc_expert"
    t.datetime "conc_sign_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "solution_proposal_id"
    t.index ["solution_proposal_id"], name: "index_conclusions_on_solution_proposal_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "prop_number"
    t.datetime "prop_date_from"
    t.string "prop_cert_system"
    t.string "prop_applic_name"
    t.string "prop_applic_reg_doc"
    t.string "prop_applic_address"
    t.text "prop_applic_bank_detail"
    t.string "prop_applic_phone"
    t.string "prop_applic_fax"
    t.string "prop_applic_email"
    t.string "prop_applic_code_okato"
    t.string "prop_applic_type_own"
    t.string "prop_applic_code_okonh"
    t.string "prop_applic_code_okved"
    t.string "prop_applic_code_okpo"
    t.string "prop_applic_chief"
    t.text "prop_applic_name_product"
    t.string "prop_applic_from_issue"
    t.string "prop_manuf_name"
    t.string "prop_manuf_address"
    t.string "prop_manuf_doc"
    t.string "prop_manuf_code_okato"
    t.string "prop_manuf_type_own"
    t.string "prop_manuf_code_okonh"
    t.string "prop_manuf_code_okved"
    t.string "prop_manuf_code_okpo"
    t.string "prop_manuf_regulations"
    t.text "prop_manuf_list_doc"
    t.text "prop_manuf_add_info"
    t.string "prop_manuf_chief_org"
    t.string "prop_manuf_chief_accountant"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prop_applic_postcode"
    t.string "prop_applic_inn"
    t.string "prop_applic_kpp"
    t.string "prop_applic_code_okp"
    t.string "prop_applic_code_tn_ved"
    t.string "prop_manuf_postcode"
    t.string "prop_manuf_inn"
    t.string "prop_manuf_scheme_cert"
    t.string "prop_manuf_count_sort_cert"
    t.string "prop_manuf_group_complexity"
  end

  create_table "protocols", force: :cascade do |t|
    t.integer "solution_proposal_id"
    t.datetime "prot_date_from"
    t.text "prot_applic_name_product"
    t.string "prot_applic_code_okp"
    t.string "prot_applic_code_tn_ved"
    t.string "prot_origin_cert"
    t.string "prot_info_product"
    t.datetime "prot_date_issue_product"
    t.string "prot_shelf_life"
    t.string "prot_info_box"
    t.string "prot_label_product"
    t.string "prot_regulations_product"
    t.text "prot_evaluation_product"
    t.string "prot_requirement_test"
    t.text "prot_list_indicators"
    t.string "prot_conclusion"
    t.string "prot_expert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prot_manuf_name"
    t.string "prot_manuf_address"
    t.string "prot_manuf_postcode"
    t.index ["solution_proposal_id"], name: "index_protocols_on_solution_proposal_id"
  end

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "set_name"
    t.text "set_organization"
    t.integer "set_at_x"
    t.integer "set_at_y"
    t.string "set_address"
  end

  create_table "solution_proposals", force: :cascade do |t|
    t.integer "proposal_id"
    t.string "solprop_number"
    t.datetime "solprop_date_from"
    t.string "solprop_solution"
    t.text "solprop_applic_name_product"
    t.string "solprop_applic_code_okp"
    t.string "solprop_applic_code_tn_ved"
    t.string "solprop_manuf_address"
    t.string "solprop_manuf_postcode"
    t.string "solprop_manuf_doc"
    t.string "solprop_regulations"
    t.string "solprop_desc_scheme_cert"
    t.string "solprop_test_lab"
    t.string "solprop_sampling"
    t.string "solprop_list_doc_product"
    t.string "solprop_basis_work"
    t.string "solprop_add_info"
    t.string "solprop_chief_name"
    t.string "solprop_chief_org"
    t.string "solprop_expert"
    t.string "solprop_executor"
    t.boolean "solprop_applic_sign", null: false
    t.string "solprop_applic_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "solprop_manuf_name"
    t.text "solprop_manuf_list_doc"
    t.index ["proposal_id"], name: "index_solution_proposals_on_proposal_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.integer "conclusion_id"
    t.string "sol_number"
    t.datetime "sol_date_from"
    t.string "sol_delivery"
    t.string "sol_solution_proposal_num"
    t.datetime "sol_solution_proposal_date"
    t.string "sol_contract_num"
    t.datetime "sol_contract_date"
    t.string "sol_directive_num"
    t.datetime "sol_directive_date"
    t.text "sol_name_product"
    t.string "sol_code_okp"
    t.string "sol_code_tn_ved"
    t.string "sol_manuf_name"
    t.string "sol_manuf_address"
    t.string "sol_manuf_postcode"
    t.string "sol_manuf_doc"
    t.string "sol_manuf_regulations"
    t.text "sol_desc_scheme_cert"
    t.text "sol_test_report"
    t.string "sol_list_doc"
    t.datetime "sol_conclusion_date"
    t.datetime "sol_cert_expiry_date"
    t.string "sol_place_marking"
    t.string "sol_inspection_period"
    t.string "sol_inspection_method"
    t.string "sol_inspection_work_basis"
    t.text "sol_add_info"
    t.string "sol_chief_name"
    t.string "sol_chief_org"
    t.string "sol_expert"
    t.string "sol_executor"
    t.boolean "sol_applic_sign", default: false, null: false
    t.string "sol_applic_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conclusion_id"], name: "index_solutions_on_conclusion_id"
  end

end
