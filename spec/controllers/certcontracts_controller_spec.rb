# frozen_string_literal: true

require 'rails_helper'

describe CertcontractsController, type: :controller do
  render_views

  let!(:proposal) { create(:proposal) }
  let!(:setting) { create(:setting) }
  let!(:certcontract) { create(:certcontract) }
  let!(:user) { create(:user) }
  let!(:valid_params) do
    {
      applic_active: 'applic_active',
      applic_address: 'applic_address',
      applic_bank_details: 'applic_bank_details',
      applic_based_doc: 'applic_based_doc',
      applic_chief_name: 'applic_chief_name',
      applic_chief_name_sign: 'applic_chief_name_sign',
      applic_chief_position: 'applic_chief_position',
      applic_chief_position_sign: 'applic_chief_position_sign',
      applic_name: 'applic_name',
      applic_name_product: 'applic_name_product',
      applic_named: 'applic_named',
      applic_postcode: 'applic_postcode',
      date_expiry: Date.new,
      date_from: Date.new,
      org_active: 'org_active',
      org_address: 'org_address',
      org_bank_details: 'org_bank_details',
      org_based_doc: 'org_based_doc',
      org_chief_name: 'org_chief_name',
      org_chief_name_sign: 'org_chief_name_sign',
      org_chief_position: 'org_chief_position',
      org_chief_position_sign: 'org_chief_position_sign',
      org_name: 'org_name',
      org_named: 'org_named',
      org_postcode: 'org_postcode',
      os_city: 'os_city',
      price_work: 'price_work',
      price_work_total: 'price_work_total',
      registration_date: Date.new,
      registration_num: 'registration_num',
      proposal_id: proposal.id
    }
  end
  let!(:invalid_params) do
    {
      applic_active: 'applic_active',
      applic_address: 'applic_address',
      applic_bank_details: 'applic_bank_details',
      applic_based_doc: 'applic_based_doc',
      applic_chief_name: 'applic_chief_name',
      applic_chief_name_sign: 'applic_chief_name_sign',
      applic_chief_position: 'applic_chief_position',
      applic_chief_position_sign: 'applic_chief_position_sign',
      applic_name: 'applic_name',
      applic_name_product: 'applic_name_product',
      applic_named: 'applic_named',
      applic_postcode: 'applic_postcode',
      date_expiry: nil,
      date_from: nil,
      org_active: 'org_active',
      org_address: 'org_address',
      org_bank_details: 'org_bank_details',
      org_based_doc: 'org_based_doc',
      org_chief_name: 'org_chief_name',
      org_chief_name_sign: 'org_chief_name_sign',
      org_chief_position: 'org_chief_position',
      org_chief_position_sign: 'org_chief_position_sign',
      org_name: 'org_name',
      org_named: 'org_named',
      org_postcode: 'org_postcode',
      os_city: 'os_city',
      price_work: 'price_work',
      price_work_total: 'price_work_total',
      registration_date: Date.new,
      registration_num: 'registration_num',
      proposal_id: proposal.id
    }
  end

  describe 'GET #new' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #new', class: Certcontract, parent: Proposal
    end

    context 'not signed in' do
      before { get :new }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #show' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #show', class: Certcontract
    end

    context 'not signed in' do
      before { get :show, params: { id: certcontract.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'POST #create' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'post #create', class: Certcontract
    end

    context 'not signed in' do
      before { post :create, params: { certcontract: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #edit', class: Certcontract
    end

    context 'not signed in' do
      before { get :edit, params: { id: certcontract.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'put #update', class: Certcontract

      context 'valid params' do
        before { put :update, params: { id: certcontract.id, certcontract: valid_params } }

        it 'should update the object' do
          certcontract.reload
          expect(certcontract.applic_active).to eq valid_params[:applic_active]
          expect(certcontract.applic_address).to eq valid_params[:applic_address]
          expect(certcontract.applic_bank_details).to eq valid_params[:applic_bank_details]
          expect(certcontract.applic_based_doc).to eq valid_params[:applic_based_doc]
          expect(certcontract.applic_chief_name).to eq valid_params[:applic_chief_name]
          expect(certcontract.applic_chief_name_sign).to eq valid_params[:applic_chief_name_sign]
          expect(certcontract.applic_chief_position).to eq valid_params[:applic_chief_position]
          expect(certcontract.applic_chief_position_sign).to eq valid_params[:applic_chief_position_sign]
          expect(certcontract.applic_name).to eq valid_params[:applic_name]
          expect(certcontract.applic_name_product).to eq valid_params[:applic_name_product]
          expect(certcontract.applic_named).to eq valid_params[:applic_named]
          expect(certcontract.applic_postcode).to eq valid_params[:applic_postcode]
          expect(certcontract.date_expiry).to eq valid_params[:date_expiry]
          expect(certcontract.date_from).to eq valid_params[:date_from]
          expect(certcontract.org_active).to eq valid_params[:org_active]
          expect(certcontract.org_address).to eq valid_params[:org_address]
          expect(certcontract.org_bank_details).to eq valid_params[:org_bank_details]
          expect(certcontract.org_based_doc).to eq valid_params[:org_based_doc]
          expect(certcontract.org_chief_name).to eq valid_params[:org_chief_name]
          expect(certcontract.org_chief_name_sign).to eq valid_params[:org_chief_name_sign]
          expect(certcontract.org_chief_position).to eq valid_params[:org_chief_position]
          expect(certcontract.org_chief_position_sign).to eq valid_params[:org_chief_position_sign]
          expect(certcontract.org_name).to eq valid_params[:org_name]
          expect(certcontract.org_named).to eq valid_params[:org_named]
          expect(certcontract.org_postcode).to eq valid_params[:org_postcode]
          expect(certcontract.os_city).to eq valid_params[:os_city]
          expect(certcontract.price_work).to eq valid_params[:price_work]
          expect(certcontract.price_work_total).to eq valid_params[:price_work_total]
          expect(certcontract.registration_date).to eq valid_params[:registration_date]
          expect(certcontract.registration_num).to eq valid_params[:registration_num]
        end
      end

      context 'invalid params' do
        it 'should update the object' do
          expect { put :update, params: { id: certcontract.id, certcontract: invalid_params } }
            .not_to(change { certcontract.reload.org_based_doc })
        end
      end
    end

    context 'not signed in' do
      before { put :update, params: { id: certcontract.id, certcontract: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'delete #destroy', class: Certcontract, url: 'root'
    end

    context 'not signed in' do
      before { delete :destroy, params: { id: certcontract.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end
end
