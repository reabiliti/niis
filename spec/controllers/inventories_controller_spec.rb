# frozen_string_literal: true

require 'rails_helper'

describe InventoriesController, type: :controller do
  render_views

  let!(:setting) { create(:setting) }
  let!(:proposal) { create(:proposal) }
  let!(:inventory) { create(:inventory) }
  let!(:user) { create(:user) }
  let!(:valid_params) do
    {
      date_from: Date.new,
      exec_name: 'new_exec_name',
      list_doc: 'new_list_doc',
      list_page: 'new_list_page',
      os_chief_name: 'new_os_chief_name',
      proposal_id: proposal.id
    }
  end
  let!(:invalid_params) do
    {
      date_from: nil,
      exec_name: 'new_exec_name',
      list_doc: 'new_list_doc',
      list_page: 'new_list_page',
      os_chief_name: 'new_os_chief_name',
      proposal_id: proposal.id
    }
  end

  describe 'GET #new' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #new', class: Inventory, parent: Proposal
    end

    context 'not signed in' do
      before { get :new }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #show' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #show', class: Inventory
    end

    context 'not signed in' do
      before { get :show, params: { id: inventory.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'POST #create' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'post #create', class: Inventory
    end

    context 'not signed in' do
      before { post :create, params: { inventory: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #edit', class: Inventory
    end

    context 'not signed in' do
      before { get :edit, params: { id: inventory.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'put #update', class: Inventory

      context 'valid params' do
        before { put :update, params: { id: inventory.id, inventory: valid_params } }

        it 'should update the object' do
          inventory.reload
          expect(inventory.date_from).to eq valid_params[:date_from]
          expect(inventory.exec_name).to eq valid_params[:exec_name]
          expect(inventory.list_doc).to eq valid_params[:list_doc]
          expect(inventory.list_page).to eq valid_params[:list_page]
          expect(inventory.os_chief_name).to eq valid_params[:os_chief_name]
        end
      end

      context 'invalid params' do
        it 'should update the object' do
          expect { put :update, params: { id: inventory.id, inventory: invalid_params } }
            .not_to(change { inventory.reload.exec_name })
        end
      end
    end

    context 'not signed in' do
      before { put :update, params: { id: inventory.id, inventory: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'delete #destroy', class: Inventory, url: 'root'
    end

    context 'not signed in' do
      before { delete :destroy, params: { id: inventory.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end
end
