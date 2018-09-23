class RemoveOldColumnInventoryProtocolConclusion < ActiveRecord::Migration[5.2]
  def change
    safety_assured { remove_column :inventories, :inv_chief_name, :string }
    safety_assured { remove_column :inventories, :inv_date_from, :datetime }
    safety_assured { remove_column :inventories, :inv_exec_name, :string   }
    safety_assured { remove_column :inventories, :inv_list_doc, :string }
    safety_assured { remove_column :inventories, :inv_list_page, :string }

    safety_assured { remove_column :protocols, :prot_applic_code_okp, :string }
    safety_assured { remove_column :protocols, :prot_applic_code_tn_ved, :string }
    safety_assured { remove_column :protocols, :prot_applic_name_product, :text }
    safety_assured { remove_column :protocols, :prot_conclusion, :string }
    safety_assured { remove_column :protocols, :prot_date_from, :datetime }
    safety_assured { remove_column :protocols, :prot_date_issue_product, :datetime }
    safety_assured { remove_column :protocols, :prot_evaluation_product, :text }
    safety_assured { remove_column :protocols, :prot_expert, :string }
    safety_assured { remove_column :protocols, :prot_info_box, :string }
    safety_assured { remove_column :protocols, :prot_info_product, :string }
    safety_assured { remove_column :protocols, :prot_label_product, :string }
    safety_assured { remove_column :protocols, :prot_list_indicators, :text }
    safety_assured { remove_column :protocols, :prot_manuf_address, :string }
    safety_assured { remove_column :protocols, :prot_manuf_name, :string }
    safety_assured { remove_column :protocols, :prot_manuf_postcode, :string }
    safety_assured { remove_column :protocols, :prot_origin_cert, :string }
    safety_assured { remove_column :protocols, :prot_regulations_product, :string }
    safety_assured { remove_column :protocols, :prot_requirement_test, :string }
    safety_assured { remove_column :protocols, :prot_shelf_life, :string }

    safety_assured { remove_column :conclusions, :conc_add_info, :text }
    safety_assured { remove_column :conclusions, :conc_attachment, :string }
    safety_assured { remove_column :conclusions, :conc_cert_expiry_date, :datetime }
    safety_assured { remove_column :conclusions, :conc_code_okp, :string }
    safety_assured { remove_column :conclusions, :conc_code_tn_ved, :string }
    safety_assured { remove_column :conclusions, :conc_conformity, :string }
    safety_assured { remove_column :conclusions, :conc_desc_scheme_cert, :text }
    safety_assured { remove_column :conclusions, :conc_expert, :string   }
    safety_assured { remove_column :conclusions, :conc_list_doc, :string }
    safety_assured { remove_column :conclusions, :conc_manuf_address, :string }
    safety_assured { remove_column :conclusions, :conc_manuf_doc, :string }
    safety_assured { remove_column :conclusions, :conc_manuf_name, :string }
    safety_assured { remove_column :conclusions, :conc_manuf_postcode, :string }
    safety_assured { remove_column :conclusions, :conc_manuf_regulations, :string }
    safety_assured { remove_column :conclusions, :conc_may_be_issued, :string }
    safety_assured { remove_column :conclusions, :conc_name_product, :text }
    safety_assured { remove_column :conclusions, :conc_sign_date, :datetime }
    safety_assured { remove_column :conclusions, :conc_solution_proposal_date, :datetime }
    safety_assured { remove_column :conclusions, :conc_solution_proposal_num, :string }
    safety_assured { remove_column :conclusions, :conc_test_report, :text }

    add_column :solution_proposals, :decision_was_made, :string
  end
end
