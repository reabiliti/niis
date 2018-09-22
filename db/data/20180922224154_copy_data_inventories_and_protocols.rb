class CopyDataInventoriesAndProtocols < ActiveRecord::Migration[5.2]
  def up
    Inventory.all.each do |inventory|
      inventory.update!(
        os_chief_name: inventory.inv_chief_name,
        date_from: inventory.inv_date_from,
        exec_name: inventory.inv_exec_name,
        list_doc: inventory.inv_list_doc,
        list_page: inventory.inv_list_page
      )
    end

    Protocol.all.each do |protocol|
      protocol.update!(
        applic_code_okp: protocol.prot_applic_code_okp,
        applic_code_tn_ved: protocol.prot_applic_code_tn_ved,
        applic_name_product: protocol.prot_applic_name_product,
        conclusion: protocol.prot_conclusion,
        date_from: protocol.prot_date_from,
        date_issue_product: protocol.prot_date_issue_product,
        evaluation_product: protocol.prot_evaluation_product,
        expert: protocol.prot_expert,
        info_box: protocol.prot_info_box,
        info_product: protocol.prot_info_product,
        label_product: protocol.prot_label_product,
        list_indicators: protocol.prot_list_indicators,
        manuf_address: protocol.prot_manuf_address,
        manuf_name: protocol.prot_manuf_name,
        manuf_postcode: protocol.prot_manuf_postcode,
        origin_cert: protocol.prot_origin_cert,
        manuf_regulations: protocol.prot_regulations_product,
        requirement_test: protocol.prot_requirement_test,
        shelf_life: protocol.prot_shelf_life
      )
    end

    Conclusion.all.each do |conclusion|
      conclusion.update!(
        add_info: conclusion.conc_add_info,
        attachment: conclusion.conc_attachment,
        cert_expiry_date: conclusion.conc_cert_expiry_date,
        applic_code_okp: conclusion.conc_code_okp,
        applic_code_tn_ved: conclusion.conc_code_tn_ved,
        conformity: conclusion.conc_conformity,
        desc_scheme_cert: conclusion.conc_desc_scheme_cert,
        expert: conclusion.conc_expert,
        list_doc_product: conclusion.conc_list_doc,
        manuf_address: conclusion.conc_manuf_address,
        manuf_doc: conclusion.conc_manuf_doc,
        manuf_name: conclusion.conc_manuf_name,
        manuf_postcode: conclusion.conc_manuf_postcode,
        manuf_regulations: conclusion.conc_manuf_regulations,
        may_be_issued: conclusion.conc_may_be_issued,
        applic_name_product: conclusion.conc_name_product,
        sign_date: conclusion.conc_sign_date,
        date_from: conclusion.conc_solution_proposal_date,
        number: conclusion.conc_solution_proposal_num,
        test_report: conclusion.conc_test_report
      )
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
