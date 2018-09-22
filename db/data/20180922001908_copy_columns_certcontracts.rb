class CopyColumnsCertcontracts < ActiveRecord::Migration[5.2]
  def up
    Certcontract.all.each do |certcontract|
      certcontract.update!(
        org_chief_name_sign: certcontract.cecon_exec_chief_name_sign,
        registration_date: certcontract.cecon_registration_date,
        registration_num: certcontract.cecon_registration_num,
        os_city: certcontract.cecon_registration_city,
        org_name: certcontract.cecon_exec_name,
        org_named: certcontract.cecon_exec_named,
        org_chief_position: certcontract.cecon_exec_chief_position,
        org_chief_name: certcontract.cecon_exec_chief_name,
        org_active: certcontract.cecon_exec_active,
        org_based_doc: certcontract.cecon_exec_based_doc,
        applic_name: certcontract.cecon_client_name,
        applic_named: certcontract.cecon_client_named,
        applic_chief_position: certcontract.cecon_client_chief_position,
        applic_chief_name: certcontract.cecon_client_chief_name,
        applic_active: certcontract.cecon_client_active,
        applic_based_doc: certcontract.cecon_client_based_doc,
        applic_name_product: certcontract.cecon_name_product,
        date_from: certcontract.cecon_date_from,
        date_expiry: certcontract.cecon_date_expiry,
        org_address: certcontract.cecon_exec_address,
        org_bank_details: certcontract.cecon_exec_bank_details,
        applic_address: certcontract.cecon_client_address,
        applic_bank_details: certcontract.cecon_client_bank_details,
        org_chief_position_sign: certcontract.cecon_exec_chief_position_sign,
        applic_chief_position_sign: certcontract.cecon_client_chief_position_sign,
        applic_chief_name_sign: certcontract.cecon_client_chief_name_sign,
        price_work: certcontract.cecon_price_work,
        price_work_total: certcontract.cecon_price_work_total
      )
    end

    Proposal.all.each do |proposal|
      proposal.update!(
        applic_chief_name: proposal.applic_chief,
        manuf_chief_name: proposal.manuf_chief_org
      )
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
