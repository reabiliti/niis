# frozen_string_literal: true

require 'rails_helper'

describe SettingsController, type: :controller do
  render_views

  let!(:setting) { create(:setting) }
  let!(:user) { create(:user) }
  let!(:valid_params) do
    {
      at_x: 0,
      at_y: 0,
      name: 'new_name',
      org_address: 'new_org_address',
      org_based_doc: 'new_org_based_doc',
      org_chief_accountant: 'new_org_chief_accountant',
      org_chief_name: 'new_org_chief_name',
      org_chief_position: 'new_org_chief_position',
      org_name: 'new_org_name',
      org_phone: 'new_org_phone',
      org_postcode: 'new_org_postcode',
      os_address: 'new_os_address',
      os_based_doc: 'new_os_based_doc',
      os_chief_name: 'new_os_chief_name',
      os_chief_position: 'new_os_chief_position',
      os_city: 'new_os_city',
      os_name: 'new_os_name',
      os_postcode: 'new_os_postcode',
      os_registration_date: Date.new,
      os_registration_num: 'new_os_registration_num'
    }
  end
  let!(:invalid_params) do
    {
      at_x: 0,
      at_y: 0,
      name: 'new_name',
      org_address: 'new_org_address',
      org_based_doc: 'new_org_based_doc',
      org_chief_accountant: 'new_org_chief_accountant',
      org_chief_name: 'new_org_chief_name',
      org_chief_position: 'new_org_chief_position',
      org_name: 'new_org_name',
      org_phone: 'new_org_phone',
      org_postcode: 'new_org_postcode',
      os_address: 'new_os_address',
      os_based_doc: 'new_os_based_doc',
      os_chief_name: 'new_os_chief_name',
      os_chief_position: 'new_os_chief_position',
      os_city: 'new_os_city',
      os_name: 'new_os_name',
      os_postcode: 'new_os_postcode',
      os_registration_date: nil,
      os_registration_num: nil
    }
  end

  describe 'GET #new' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #new', class: Setting
    end

    context 'not signed in' do
      before { get :new }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #show' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #show', class: Setting
    end

    context 'not signed in' do
      before { get :show, params: { id: setting.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'POST #create' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'post #create', class: Setting
    end

    context 'not signed in' do
      before { post :create, params: { setting: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #edit', class: Setting
    end

    context 'not signed in' do
      before { get :edit, params: { id: setting.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'put #update', class: Setting

      context 'valid params' do
        before { put :update, params: { id: setting.id, setting: valid_params } }

        it 'should update the object' do
          setting.reload
          expect(setting.at_x).to eq valid_params[:at_x]
          expect(setting.at_y).to eq valid_params[:at_y]
          expect(setting.name).to eq valid_params[:name]
          expect(setting.org_address).to eq valid_params[:org_address]
          expect(setting.org_based_doc).to eq valid_params[:org_based_doc]
          expect(setting.org_chief_accountant).to eq valid_params[:org_chief_accountant]
          expect(setting.org_chief_name).to eq valid_params[:org_chief_name]
          expect(setting.org_chief_position).to eq valid_params[:org_chief_position]
          expect(setting.org_name).to eq valid_params[:org_name]
          expect(setting.org_phone).to eq valid_params[:org_phone]
          expect(setting.org_postcode).to eq valid_params[:org_postcode]
          expect(setting.os_address).to eq valid_params[:os_address]
          expect(setting.os_based_doc).to eq valid_params[:os_based_doc]
          expect(setting.os_chief_name).to eq valid_params[:os_chief_name]
          expect(setting.os_chief_position).to eq valid_params[:os_chief_position]
          expect(setting.os_city).to eq valid_params[:os_city]
          expect(setting.os_name).to eq valid_params[:os_name]
          expect(setting.os_postcode).to eq valid_params[:os_postcode]
          expect(setting.os_registration_date).to eq valid_params[:os_registration_date]
          expect(setting.os_registration_num).to eq valid_params[:os_registration_num]
        end
      end

      context 'invalid params' do
        it 'should update the object' do
          expect { put :update, params: { id: setting.id, setting: invalid_params } }
            .not_to(change { setting.reload.os_registration_num })
        end
      end
    end

    context 'not signed in' do
      before { put :update, params: { id: setting.id, setting: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end
end
