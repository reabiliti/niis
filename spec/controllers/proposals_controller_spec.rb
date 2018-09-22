# frozen_string_literal: true

require 'rails_helper'

describe ProposalsController, type: :controller do
  render_views

  let!(:proposal) { create(:proposal) }
  let!(:setting) { create(:setting) }
  let!(:user) { create(:user) }
  let!(:valid_params) do
    {
      applic_address: 'new_applic_address',
      applic_bank_detail: 'new_applic_bank_detail',
      applic_chief_name: 'new_applic_chief_name',
      applic_chief_position: 'new_applic_chief_position',
      applic_code_okato: 'new_applic_code_okato',
      applic_code_okonh: 'new_applic_code_okonh',
      applic_code_okp: 'new_applic_code_okp',
      applic_code_okpo: 'new_applic_code_okpo',
      applic_code_okved: 'new_applic_code_okved',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_email: 'new_applic_email',
      applic_fax: 'new_applic_fax',
      applic_from_issue: 'new_applic_from_issue',
      applic_inn: 'new_applic_inn',
      applic_kpp: 'new_applic_kpp',
      applic_name: 'new_applic_name',
      applic_name_product: 'new_applic_name_product',
      applic_phone: 'new_applic_phone',
      applic_postcode: 'new_applic_postcode',
      applic_reg_doc: 'new_applic_reg_doc',
      applic_type_own: 'new_applic_type_own',
      cert_system: 'new_cert_system',
      date_from: Date.new,
      manuf_add_info: 'new_manuf_add_info',
      manuf_address: 'new_manuf_address',
      manuf_chief_accountant: 'new_manuf_chief_accountant',
      manuf_chief_name: 'new_manuf_chief_name',
      manuf_chief_position: 'new_manuf_chief_position',
      manuf_code_okato: 'new_manuf_code_okato',
      manuf_code_okonh: 'new_manuf_code_okonh',
      manuf_code_okpo: 'new_manuf_code_okpo',
      manuf_code_okved: 'new_manuf_code_okved',
      manuf_count_sort_cert: 'new_manuf_count_sort_cert',
      manuf_doc: 'new_manuf_doc',
      manuf_group_complexity: 'new_manuf_group_complexity',
      manuf_inn: 'new_manuf_inn',
      manuf_list_doc: 'new_manuf_list_doc',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      manuf_scheme_cert: 'new_manuf_scheme_cert',
      manuf_type_own: 'new_manuf_type_own',
      number: 'new_number'
    }
  end
  let!(:invalid_params) do
    {
      applic_address: 'new_applic_address',
      applic_bank_detail: 'new_applic_bank_detail',
      applic_chief_name: 'new_applic_chief_name',
      applic_chief_position: 'new_applic_chief_position',
      applic_code_okato: 'new_applic_code_okato',
      applic_code_okonh: 'new_applic_code_okonh',
      applic_code_okp: 'new_applic_code_okp',
      applic_code_okpo: 'new_applic_code_okpo',
      applic_code_okved: 'new_applic_code_okved',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_email: 'new_applic_email',
      applic_fax: 'new_applic_fax',
      applic_from_issue: 'new_applic_from_issue',
      applic_inn: 'new_applic_inn',
      applic_kpp: 'new_applic_kpp',
      applic_name: 'new_applic_name',
      applic_name_product: 'new_applic_name_product',
      applic_phone: 'new_applic_phone',
      applic_postcode: 'new_applic_postcode',
      applic_reg_doc: 'new_applic_reg_doc',
      applic_type_own: 'new_applic_type_own',
      cert_system: 'new_cert_system',
      date_from: Date.new,
      manuf_add_info: 'new_manuf_add_info',
      manuf_address: 'new_manuf_address',
      manuf_chief_accountant: 'new_manuf_chief_accountant',
      manuf_chief_name: 'new_manuf_chief_name',
      manuf_chief_position: 'new_manuf_chief_position',
      manuf_code_okato: 'new_manuf_code_okato',
      manuf_code_okonh: 'new_manuf_code_okonh',
      manuf_code_okpo: 'new_manuf_code_okpo',
      manuf_code_okved: 'new_manuf_code_okved',
      manuf_count_sort_cert: 'new_manuf_count_sort_cert',
      manuf_doc: 'new_manuf_doc',
      manuf_group_complexity: 'new_manuf_group_complexity',
      manuf_inn: 'new_manuf_inn',
      manuf_list_doc: 'new_manuf_list_doc',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      manuf_scheme_cert: 'new_manuf_scheme_cert',
      manuf_type_own: 'new_manuf_type_own',
      number: nil
    }
  end

  describe 'GET #new' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #new', class: Proposal
    end

    context 'not signed in' do
      before { get :new }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #show' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #show', class: Proposal
    end

    context 'not signed in' do
      before { get :show, params: { id: proposal.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'POST #create' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'post #create', class: Proposal
    end

    context 'not signed in' do
      before { post :create, params: { proposal: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #edit', class: Proposal
    end

    context 'not signed in' do
      before { get :edit, params: { id: proposal.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'put #update', class: Proposal

      context 'valid params' do
        before { put :update, params: { id: proposal.id, proposal: valid_params } }

        it 'should update the object' do
          proposal.reload
          expect(proposal.applic_address).to eq valid_params[:applic_address]
          expect(proposal.applic_bank_detail).to eq valid_params[:applic_bank_detail]
          expect(proposal.applic_chief_name).to eq valid_params[:applic_chief_name]
          expect(proposal.applic_chief_position).to eq valid_params[:applic_chief_position]
          expect(proposal.applic_code_okato).to eq valid_params[:applic_code_okato]
          expect(proposal.applic_code_okonh).to eq valid_params[:applic_code_okonh]
          expect(proposal.applic_code_okp).to eq valid_params[:applic_code_okp]
          expect(proposal.applic_code_okpo).to eq valid_params[:applic_code_okpo]
          expect(proposal.applic_code_okved).to eq valid_params[:applic_code_okved]
          expect(proposal.applic_code_tn_ved).to eq valid_params[:applic_code_tn_ved]
          expect(proposal.applic_email).to eq valid_params[:applic_email]
          expect(proposal.applic_fax).to eq valid_params[:applic_fax]
          expect(proposal.applic_from_issue).to eq valid_params[:applic_from_issue]
          expect(proposal.applic_inn).to eq valid_params[:applic_inn]
          expect(proposal.applic_kpp).to eq valid_params[:applic_kpp]
          expect(proposal.applic_name).to eq valid_params[:applic_name]
          expect(proposal.applic_name_product).to eq valid_params[:applic_name_product]
          expect(proposal.applic_phone).to eq valid_params[:applic_phone]
          expect(proposal.applic_postcode).to eq valid_params[:applic_postcode]
          expect(proposal.applic_reg_doc).to eq valid_params[:applic_reg_doc]
          expect(proposal.applic_type_own).to eq valid_params[:applic_type_own]
          expect(proposal.cert_system).to eq valid_params[:cert_system]
          expect(proposal.date_from).to eq valid_params[:date_from]
          expect(proposal.manuf_add_info).to eq valid_params[:manuf_add_info]
          expect(proposal.manuf_address).to eq valid_params[:manuf_address]
          expect(proposal.manuf_chief_accountant).to eq valid_params[:manuf_chief_accountant]
          expect(proposal.manuf_chief_name).to eq valid_params[:manuf_chief_name]
          expect(proposal.manuf_chief_position).to eq valid_params[:manuf_chief_position]
          expect(proposal.manuf_code_okato).to eq valid_params[:manuf_code_okato]
          expect(proposal.manuf_code_okonh).to eq valid_params[:manuf_code_okonh]
          expect(proposal.manuf_code_okpo).to eq valid_params[:manuf_code_okpo]
          expect(proposal.manuf_code_okved).to eq valid_params[:manuf_code_okved]
          expect(proposal.manuf_count_sort_cert).to eq valid_params[:manuf_count_sort_cert]
          expect(proposal.manuf_doc).to eq valid_params[:manuf_doc]
          expect(proposal.manuf_group_complexity).to eq valid_params[:manuf_group_complexity]
          expect(proposal.manuf_inn).to eq valid_params[:manuf_inn]
          expect(proposal.manuf_list_doc).to eq valid_params[:manuf_list_doc]
          expect(proposal.manuf_name).to eq valid_params[:manuf_name]
          expect(proposal.manuf_postcode).to eq valid_params[:manuf_postcode]
          expect(proposal.manuf_regulations).to eq valid_params[:manuf_regulations]
          expect(proposal.manuf_scheme_cert).to eq valid_params[:manuf_scheme_cert]
          expect(proposal.manuf_type_own).to eq valid_params[:manuf_type_own]
          expect(proposal.number).to eq valid_params[:number]
        end
      end

      context 'invalid params' do
        it 'should update the object' do
          expect { put :update, params: { id: proposal.id, proposal: invalid_params } }
            .not_to(change { proposal.reload.applic_type_own })
        end
      end
    end

    context 'not signed in' do
      before { put :update, params: { id: proposal.id, proposal: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'delete #destroy', class: Proposal, url: 'root'
    end

    context 'not signed in' do
      before { delete :destroy, params: { id: proposal.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end
end
