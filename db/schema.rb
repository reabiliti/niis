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

ActiveRecord::Schema.define(version: 2018_09_22_032255) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachments", force: :cascade do |t|
    t.bigint "certificate_id"
    t.string "att_blank_num"
    t.string "att_code_okp"
    t.string "att_code_tn_ved"
    t.string "att_name_product"
    t.string "att_manuf_name"
    t.string "att_regulations"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_attachments_on_certificate_id"
  end

  create_table "certcontracts", force: :cascade do |t|
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "org_chief_name_sign"
    t.datetime "registration_date"
    t.string "registration_num"
    t.string "os_city"
    t.string "org_name"
    t.string "org_named"
    t.string "org_chief_position"
    t.string "org_chief_name"
    t.string "org_active"
    t.string "org_based_doc"
    t.string "applic_name"
    t.string "applic_named"
    t.string "applic_chief_position"
    t.string "applic_chief_name"
    t.string "applic_active"
    t.string "applic_based_doc"
    t.string "applic_name_product"
    t.datetime "date_from"
    t.datetime "date_expiry"
    t.string "org_address"
    t.string "org_postcode"
    t.string "org_bank_details"
    t.string "applic_address"
    t.string "applic_postcode"
    t.string "applic_bank_details"
    t.string "org_chief_position_sign"
    t.string "applic_chief_position_sign"
    t.string "applic_chief_name_sign"
    t.string "price_work"
    t.string "price_work_total"
    t.index ["proposal_id"], name: "index_certcontracts_on_proposal_id"
  end

  create_table "certificates", force: :cascade do |t|
    t.bigint "solution_id"
    t.datetime "cert_expiry_date"
    t.string "cert_name_product"
    t.string "cert_manuf_regulations"
    t.string "cert_code_okp"
    t.string "cert_code_tn_ved"
    t.string "cert_manuf_doc"
    t.string "cert_manuf_name"
    t.string "cert_manuf_inn"
    t.string "cert_manuf_address"
    t.string "cert_manuf_postcode"
    t.string "cert_test_report"
    t.string "cert_add_info"
    t.string "cert_place_marking"
    t.string "cert_chief_org"
    t.string "cert_expert"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "cert_registration_date"
    t.string "cert_registration_num"
    t.string "cert_blank_num"
    t.string "cert_applic_name"
    t.string "cert_applic_inn"
    t.string "cert_applic_address"
    t.string "cert_applic_postcode"
    t.string "cert_applic_phone"
    t.integer "cert_name_product_size_font"
    t.index ["solution_id"], name: "index_certificates_on_solution_id"
  end

  create_table "conclusions", force: :cascade do |t|
    t.string "conc_solution_proposal_num"
    t.datetime "conc_solution_proposal_date"
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
    t.bigint "solution_proposal_id"
    t.index ["solution_proposal_id"], name: "index_conclusions_on_solution_proposal_id"
  end

  create_table "data_migrations", primary_key: "version", id: :string, force: :cascade do |t|
  end

  create_table "ikcontracts", force: :cascade do |t|
    t.bigint "certificate_id"
    t.datetime "ikcon_registration_date"
    t.string "ikcon_registration_num"
    t.string "ikcon_exec_name"
    t.string "ikcon_exec_named"
    t.string "ikcon_exec_chief_position"
    t.string "ikcon_exec_active"
    t.string "ikcon_exec_based_doc"
    t.string "ikcon_client_name"
    t.string "ikcon_client_named"
    t.string "ikcon_client_chief_position"
    t.string "ikcon_client_active"
    t.string "ikcon_client_based_doc"
    t.string "ikcon_name_product"
    t.string "ikcon_cert_registration_num"
    t.string "ikcon_inspection_period"
    t.string "ikcon_contract_time"
    t.string "ikcon_exec_address"
    t.string "ikcon_exec_bank_details"
    t.string "ikcon_client_address"
    t.string "ikcon_client_bank_details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ikcon_registration_city"
    t.string "ikcon_exec_chief_name"
    t.string "ikcon_client_chief_name"
    t.string "ikcon_exec_chief_position_sign"
    t.string "ikcon_exec_chief_name_sign"
    t.string "ikcon_client_chief_position_sign"
    t.string "ikcon_client_chief_name_sign"
    t.index ["certificate_id"], name: "index_ikcontracts_on_certificate_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.bigint "proposal_id"
    t.datetime "inv_date_from"
    t.string "inv_list_doc"
    t.string "inv_list_page"
    t.string "inv_exec_name"
    t.string "inv_chief_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_id"], name: "index_inventories_on_proposal_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.bigint "certificate_id"
    t.string "perm_registration_num"
    t.datetime "perm_registration_date"
    t.datetime "perm_expiry_date"
    t.string "perm_place_marking"
    t.string "perm_chief_name"
    t.string "perm_chief_org"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["certificate_id"], name: "index_permissions_on_certificate_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.datetime "date_from"
    t.string "cert_system"
    t.string "applic_name"
    t.string "applic_reg_doc"
    t.string "applic_address"
    t.string "applic_postcode"
    t.string "applic_inn"
    t.string "applic_kpp"
    t.string "applic_code_okp"
    t.string "applic_code_tn_ved"
    t.text "applic_bank_detail"
    t.string "applic_phone"
    t.string "applic_fax"
    t.string "applic_email"
    t.string "applic_code_okato"
    t.string "applic_type_own"
    t.string "applic_code_okonh"
    t.string "applic_code_okved"
    t.string "applic_code_okpo"
    t.text "applic_name_product"
    t.string "applic_from_issue"
    t.string "manuf_name"
    t.string "manuf_address"
    t.string "manuf_postcode"
    t.string "manuf_inn"
    t.string "manuf_doc"
    t.string "manuf_code_okato"
    t.string "manuf_type_own"
    t.string "manuf_code_okonh"
    t.string "manuf_code_okved"
    t.string "manuf_code_okpo"
    t.string "manuf_regulations"
    t.text "manuf_list_doc"
    t.text "manuf_add_info"
    t.string "manuf_chief_accountant"
    t.string "manuf_scheme_cert"
    t.string "manuf_count_sort_cert"
    t.string "manuf_group_complexity"
    t.string "applic_chief_position"
    t.string "applic_chief_name"
    t.string "manuf_chief_position"
    t.string "manuf_chief_name"
    t.index ["id"], name: "index_proposals_on_id"
  end

  create_table "protocols", force: :cascade do |t|
    t.bigint "solution_proposal_id"
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
    t.string "name"
    t.integer "at_x"
    t.integer "at_y"
    t.string "os_registration_num"
    t.datetime "os_registration_date"
    t.string "os_name"
    t.string "os_address"
    t.string "os_city"
    t.string "os_chief_position"
    t.string "os_chief_name"
    t.string "os_based_doc"
    t.string "org_name"
    t.string "org_address"
    t.string "org_phone"
    t.string "org_chief_position"
    t.string "org_chief_name"
    t.string "org_based_doc"
    t.string "org_chief_accountant"
    t.string "os_postcode"
    t.string "org_postcode"
  end

  create_table "solution_proposals", force: :cascade do |t|
    t.bigint "proposal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "number"
    t.datetime "date_from"
    t.string "solution"
    t.text "applic_name_product"
    t.string "applic_code_okp"
    t.string "applic_code_tn_ved"
    t.string "manuf_address"
    t.string "manuf_postcode"
    t.string "manuf_doc"
    t.string "manuf_regulations"
    t.string "desc_scheme_cert"
    t.string "test_lab"
    t.string "sampling"
    t.string "list_doc_product"
    t.string "basis_work"
    t.string "add_info"
    t.string "os_chief_position"
    t.string "os_chief_name"
    t.string "expert"
    t.string "executor"
    t.boolean "applic_sign", default: false
    t.string "applic_name"
    t.text "manuf_name"
    t.text "manuf_list_doc"
    t.index ["id"], name: "index_solution_proposals_on_id"
    t.index ["proposal_id"], name: "index_solution_proposals_on_proposal_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.bigint "conclusion_id"
    t.string "sol_number"
    t.string "sol_delivery"
    t.string "sol_solution_proposal_num"
    t.datetime "sol_solution_proposal_date"
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
    t.datetime "sol_date_from"
    t.index ["conclusion_id"], name: "index_solutions_on_conclusion_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "name", null: false
    t.datetime "remember_me_token_expires_at"
    t.string "remember_me_token"
    t.string "salt", null: false
    t.string "crypted_password", null: false
    t.string "role", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

  add_foreign_key "certcontracts", "proposals"
  add_foreign_key "conclusions", "solution_proposals"
  add_foreign_key "solution_proposals", "proposals"
end
