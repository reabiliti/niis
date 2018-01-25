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

ActiveRecord::Schema.define(version: 20180125165132) do

  create_table "certificates", force: :cascade do |t|
    t.string "cer_number"
    t.string "cer_blank_number"
    t.datetime "cer_validity_from"
    t.datetime "cer_validity_to"
    t.string "cer_org_registration"
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

  create_table "settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "set_indent_down"
    t.string "set_name"
    t.text "set_organization"
  end

end
