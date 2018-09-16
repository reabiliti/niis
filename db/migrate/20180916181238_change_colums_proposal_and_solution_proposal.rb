class ChangeColumsProposalAndSolutionProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :number, :string
    add_column :proposals, :date_from, :datetime
    add_column :proposals, :cert_system, :string
    add_column :proposals, :applic_name, :string
    add_column :proposals, :applic_reg_doc, :string
    add_column :proposals, :applic_address, :string
    add_column :proposals, :applic_postcode, :string
    add_column :proposals, :applic_inn, :string
    add_column :proposals, :applic_kpp, :string
    add_column :proposals, :applic_code_okp, :string
    add_column :proposals, :applic_code_tn_ved, :string
    add_column :proposals, :applic_bank_detail, :text
    add_column :proposals, :applic_phone, :string
    add_column :proposals, :applic_fax, :string
    add_column :proposals, :applic_email, :string
    add_column :proposals, :applic_code_okato, :string
    add_column :proposals, :applic_type_own, :string
    add_column :proposals, :applic_code_okonh, :string
    add_column :proposals, :applic_code_okved, :string
    add_column :proposals, :applic_code_okpo, :string
    add_column :proposals, :applic_chief, :string
    add_column :proposals, :applic_name_product, :text
    add_column :proposals, :applic_from_issue, :string
    add_column :proposals, :manuf_name, :string
    add_column :proposals, :manuf_address, :string
    add_column :proposals, :manuf_postcode, :string
    add_column :proposals, :manuf_inn, :string
    add_column :proposals, :manuf_doc, :string
    add_column :proposals, :manuf_code_okato, :string
    add_column :proposals, :manuf_type_own, :string
    add_column :proposals, :manuf_code_okonh, :string
    add_column :proposals, :manuf_code_okved, :string
    add_column :proposals, :manuf_code_okpo, :string
    add_column :proposals, :manuf_regulations, :string
    add_column :proposals, :manuf_list_doc, :text
    add_column :proposals, :manuf_add_info, :text
    add_column :proposals, :manuf_chief_org, :string
    add_column :proposals, :manuf_chief_accountant, :string
    add_column :proposals, :manuf_scheme_cert, :string
    add_column :proposals, :manuf_count_sort_cert, :string
    add_column :proposals, :manuf_group_complexity, :string

    add_column :solution_proposals, :number, :string
    add_column :solution_proposals, :date_from, :datetime
    add_column :solution_proposals, :solution, :string
    add_column :solution_proposals, :applic_name_product, :text
    add_column :solution_proposals, :applic_code_okp, :string
    add_column :solution_proposals, :applic_code_tn_ved, :string
    add_column :solution_proposals, :manuf_address, :string
    add_column :solution_proposals, :manuf_postcode, :string
    add_column :solution_proposals, :manuf_doc, :string
    add_column :solution_proposals, :manuf_regulations, :string
    add_column :solution_proposals, :desc_scheme_cert, :string
    add_column :solution_proposals, :test_lab, :string
    add_column :solution_proposals, :sampling, :string
    add_column :solution_proposals, :list_doc_product, :string
    add_column :solution_proposals, :basis_work, :string
    add_column :solution_proposals, :add_info, :string
    add_column :solution_proposals, :os_chief_position, :string
    add_column :solution_proposals, :os_chief_name, :string
    add_column :solution_proposals, :expert, :string
    add_column :solution_proposals, :executor, :string
    add_column :solution_proposals, :applic_sign, :boolean
    change_column_default :solution_proposals, :applic_sign, from: nil, to: false
    safety_assured { remove_column :solution_proposals, :solprop_applic_sign, :boolean, default: false }
    add_column :solution_proposals, :applic_name, :string
    add_column :solution_proposals, :manuf_name, :text
    add_column :solution_proposals, :manuf_list_doc, :text

    add_column :settings, :name, :string
    add_column :settings, :at_x, :integer
    add_column :settings, :at_y, :integer
    add_column :settings, :os_registration_num, :string
    add_column :settings, :os_registration_date, :datetime
    add_column :settings, :os_name, :string
    add_column :settings, :os_address, :string
    add_column :settings, :os_city, :string
    add_column :settings, :os_chief_position, :string
    add_column :settings, :os_chief_name, :string
    add_column :settings, :os_based_doc, :string
    add_column :settings, :org_name, :string
    add_column :settings, :org_address, :string
    add_column :settings, :org_phone, :string
    add_column :settings, :org_chief_position, :string
    add_column :settings, :org_chief_name, :string
    add_column :settings, :org_based_doc, :string
    add_column :settings, :org_chief_accountant, :string

    add_foreign_key :solution_proposals, :proposals
  end
end
