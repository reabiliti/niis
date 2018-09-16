class CopyColumsProposalAndSolutionProposalInNew < ActiveRecord::Migration[5.2]
  def up
    Proposal.all.each do |proposal|
      proposal.update!(
        number: proposal.prop_number,
        date_from: proposal.prop_date_from,
        cert_system: proposal.prop_cert_system,
        applic_name: proposal.prop_applic_name,
        applic_reg_doc: proposal.prop_applic_reg_doc,
        applic_address: proposal.prop_applic_address,
        applic_bank_detail: proposal.prop_applic_bank_detail,
        applic_phone: proposal.prop_applic_phone,
        applic_fax: proposal.prop_applic_fax,
        applic_email: proposal.prop_applic_email,
        applic_code_okato: proposal.prop_applic_code_okato,
        applic_type_own: proposal.prop_applic_type_own,
        applic_code_okonh: proposal.prop_applic_code_okonh,
        applic_code_okved: proposal.prop_applic_code_okved,
        applic_code_okpo: proposal.prop_applic_code_okpo,
        applic_chief: proposal.prop_applic_chief,
        applic_name_product: proposal.prop_applic_name_product,
        applic_from_issue: proposal.prop_applic_from_issue,
        manuf_name: proposal.prop_manuf_name,
        manuf_address: proposal.prop_manuf_address,
        manuf_doc: proposal.prop_manuf_doc,
        manuf_code_okato: proposal.prop_manuf_code_okato,
        manuf_type_own: proposal.prop_manuf_type_own,
        manuf_code_okonh: proposal.prop_manuf_code_okonh,
        manuf_code_okved: proposal.prop_manuf_code_okved,
        manuf_code_okpo: proposal.prop_manuf_code_okpo,
        manuf_regulations: proposal.prop_manuf_regulations,
        manuf_list_doc: proposal.prop_manuf_list_doc,
        manuf_add_info: proposal.prop_manuf_add_info,
        manuf_chief_org: proposal.prop_manuf_chief_org,
        manuf_chief_accountant: proposal.prop_manuf_chief_accountant,
        applic_postcode: proposal.prop_applic_postcode,
        applic_inn: proposal.prop_applic_inn,
        applic_kpp: proposal.prop_applic_kpp,
        applic_code_okp: proposal.prop_applic_code_okp,
        applic_code_tn_ved: proposal.prop_applic_code_tn_ved,
        manuf_postcode: proposal.prop_manuf_postcode,
        manuf_inn: proposal.prop_manuf_inn,
        manuf_scheme_cert: proposal.prop_manuf_scheme_cert,
        manuf_count_sort_cert: proposal.prop_manuf_count_sort_cert,
        manuf_group_complexity: proposal.prop_manuf_group_complexity
      )
    end

    SolutionProposal.all.each do |solution_proposal|
      solution_proposal.update!(
        number: solution_proposal.solprop_number,
        date_from: solution_proposal.solprop_date_from,
        solution: solution_proposal.solprop_solution,
        applic_name_product: solution_proposal.solprop_applic_name_product,
        applic_code_okp: solution_proposal.solprop_applic_code_okp,
        applic_code_tn_ved: solution_proposal.solprop_applic_code_tn_ved,
        manuf_address: solution_proposal.solprop_manuf_address,
        manuf_postcode: solution_proposal.solprop_manuf_postcode,
        manuf_doc: solution_proposal.solprop_manuf_doc,
        manuf_regulations: solution_proposal.solprop_regulations,
        desc_scheme_cert: solution_proposal.solprop_desc_scheme_cert,
        test_lab: solution_proposal.solprop_test_lab,
        sampling: solution_proposal.solprop_sampling,
        list_doc_product: solution_proposal.solprop_list_doc_product,
        basis_work: solution_proposal.solprop_basis_work,
        add_info: solution_proposal.solprop_add_info,
        os_chief_position: solution_proposal.solprop_chief_name,
        os_chief_name: solution_proposal.solprop_chief_org,
        expert: solution_proposal.solprop_expert,
        executor: solution_proposal.solprop_executor,
        applic_name: solution_proposal.solprop_applic_name,
        manuf_name: solution_proposal.solprop_manuf_name,
        manuf_list_doc: solution_proposal.solprop_manuf_list_doc
      )
    end

    Setting.all.each do |setting|
      setting.update!(
        name: setting.set_name,
        at_x: setting.set_at_x,
        at_y: setting.set_at_y,
        os_registration_num: setting.set_os_registration_num,
        os_registration_date: setting.set_os_registration_date,
        os_name: setting.set_os_name,
        os_address: setting.set_os_address,
        os_chief_position: setting.set_os_chief_position,
        os_chief_name: setting.set_os_chief_name,
        os_based_doc: setting.set_os_based_doc,
        org_name: setting.set_org_name,
        org_address: setting.set_org_address,
        org_phone: setting.set_org_phone,
        org_chief_position: setting.set_org_chief_position,
        org_chief_name: setting.set_org_chief_name,
        org_based_doc: setting.set_org_based_doc,
        org_chief_accountant: setting.set_org_chief_accountant,
        os_city: setting.set_os_city
      )
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
