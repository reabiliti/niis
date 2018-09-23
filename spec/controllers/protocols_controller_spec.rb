# frozen_string_literal: true

require 'rails_helper'

describe ProtocolsController, type: :controller do
  render_views

  let!(:setting) { create(:setting) }
  let!(:solution_proposal) { create(:solution_proposal) }
  let!(:protocol) { create(:protocol) }
  let!(:user) { create(:user) }
  let!(:valid_params) do
    {
      applic_code_okp: 'new_applic_code_okp',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_name_product: 'new_applic_name_product',
      conclusion: 'new_conclusion',
      date_from: Date.new,
      date_issue_product: Date.new,
      evaluation_product: 'new_evaluation_product',
      expert: 'new_expert',
      info_box: 'new_info_box',
      info_product: 'new_info_product',
      label_product: 'new_label_product',
      list_indicators: 'new_list_indicators',
      manuf_address: 'new_manuf_address',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      origin_cert: 'new_origin_cert',
      requirement_test: 'new_requirement_test',
      shelf_life: 'new_shelf_life',
      solution_proposal_id: solution_proposal.id
    }
  end
  let!(:invalid_params) do
    {
      applic_code_okp: 'new_applic_code_okp',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_name_product: 'new_applic_name_product',
      conclusion: 'new_conclusion',
      date_from: nil,
      date_issue_product: Date.new,
      evaluation_product: 'new_evaluation_product',
      expert: 'new_expert',
      info_box: 'new_info_box',
      info_product: 'new_info_product',
      label_product: 'new_label_product',
      list_indicators: 'new_list_indicators',
      manuf_address: 'new_manuf_address',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      origin_cert: 'new_origin_cert',
      requirement_test: 'new_requirement_test',
      shelf_life: 'new_shelf_life',
      solution_proposal_id: solution_proposal.id
    }
  end

  describe 'GET #new' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #new', class: Protocol, parent: SolutionProposal
    end

    context 'not signed in' do
      before { get :new }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #show' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #show', class: Protocol
    end

    context 'not signed in' do
      before { get :show, params: { id: protocol.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'POST #create' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'post #create', class: Protocol
    end

    context 'not signed in' do
      before { post :create, params: { protocol: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #edit', class: Protocol
    end

    context 'not signed in' do
      before { get :edit, params: { id: protocol.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'put #update', class: Protocol

      context 'valid params' do
        before { put :update, params: { id: protocol.id, protocol: valid_params } }

        it 'should update the object' do
          protocol.reload
          expect(protocol.applic_code_okp).to eq valid_params[:applic_code_okp]
          expect(protocol.applic_code_tn_ved).to eq valid_params[:applic_code_tn_ved]
          expect(protocol.applic_name_product).to eq valid_params[:applic_name_product]
          expect(protocol.conclusion).to eq valid_params[:conclusion]
          expect(protocol.date_from).to eq valid_params[:date_from]
          expect(protocol.date_issue_product).to eq valid_params[:date_issue_product]
          expect(protocol.evaluation_product).to eq valid_params[:evaluation_product]
          expect(protocol.expert).to eq valid_params[:expert]
          expect(protocol.info_box).to eq valid_params[:info_box]
          expect(protocol.info_product).to eq valid_params[:info_product]
          expect(protocol.label_product).to eq valid_params[:label_product]
          expect(protocol.list_indicators).to eq valid_params[:list_indicators]
          expect(protocol.manuf_address).to eq valid_params[:manuf_address]
          expect(protocol.manuf_name).to eq valid_params[:manuf_name]
          expect(protocol.manuf_postcode).to eq valid_params[:manuf_postcode]
          expect(protocol.manuf_regulations).to eq valid_params[:manuf_regulations]
          expect(protocol.origin_cert).to eq valid_params[:origin_cert]
          expect(protocol.requirement_test).to eq valid_params[:requirement_test]
          expect(protocol.shelf_life).to eq valid_params[:shelf_life]
        end
      end

      context 'invalid params' do
        it 'should update the object' do
          expect { put :update, params: { id: protocol.id, protocol: invalid_params } }
            .not_to(change { protocol.reload.manuf_postcode })
        end
      end
    end

    context 'not signed in' do
      before { put :update, params: { id: protocol.id, protocol: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'delete #destroy', class: Protocol, url: 'root'
    end

    context 'not signed in' do
      before { delete :destroy, params: { id: protocol.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end
end
