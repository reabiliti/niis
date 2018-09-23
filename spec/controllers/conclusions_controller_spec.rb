# frozen_string_literal: true

require 'rails_helper'

describe ConclusionsController, type: :controller do
  render_views

  let!(:setting) { create(:setting) }
  let!(:solution_proposal) { create(:solution_proposal) }
  let!(:conclusion) { create(:conclusion) }
  let!(:user) { create(:user) }
  let!(:valid_params) do
    {
      add_info: 'new_add_info',
      applic_code_okp: 'new_applic_code_okp',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_name_product: 'new_applic_name_product',
      attachment: 'new_attachment',
      cert_expiry_date: Date.new,
      conformity: 'new_conformity',
      date_from: Date.new,
      desc_scheme_cert: 'new_desc_scheme_cert',
      expert: 'new_expert',
      list_doc_product: 'new_list_doc_product',
      manuf_address: 'new_manuf_address',
      manuf_doc: 'new_manuf_doc',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      may_be_issued: 'new_may_be_issued',
      number: 'new_number',
      sign_date: Date.new,
      test_report: 'new_test_report',
      solution_proposal_id: solution_proposal.id
    }
  end
  let!(:invalid_params) do
    {
      add_info: 'new_add_info',
      applic_code_okp: 'new_applic_code_okp',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_name_product: 'new_applic_name_product',
      attachment: 'new_attachment',
      cert_expiry_date: nil,
      conformity: 'new_conformity',
      date_from: Date.new,
      desc_scheme_cert: 'new_desc_scheme_cert',
      expert: 'new_expert',
      list_doc_product: 'new_list_doc_product',
      manuf_address: 'new_manuf_address',
      manuf_doc: 'new_manuf_doc',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      may_be_issued: 'new_may_be_issued',
      number: 'new_number',
      sign_date: Date.new,
      test_report: 'new_test_report',
      solution_proposal_id: solution_proposal.id
    }
  end

  describe 'GET #new' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #new', class: Conclusion, parent: SolutionProposal
    end

    context 'not signed in' do
      before { get :new }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #show' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #show', class: Conclusion
    end

    context 'not signed in' do
      before { get :show, params: { id: conclusion.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'POST #create' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'post #create', class: Conclusion
    end

    context 'not signed in' do
      before { post :create, params: { conclusion: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #edit', class: Conclusion
    end

    context 'not signed in' do
      before { get :edit, params: { id: conclusion.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'put #update', class: Conclusion

      context 'valid params' do
        before { put :update, params: { id: conclusion.id, conclusion: valid_params } }

        it 'should update the object' do
          conclusion.reload
          expect(conclusion.add_info).to eq valid_params[:add_info]
          expect(conclusion.applic_code_okp).to eq valid_params[:applic_code_okp]
          expect(conclusion.applic_code_tn_ved).to eq valid_params[:applic_code_tn_ved]
          expect(conclusion.applic_name_product).to eq valid_params[:applic_name_product]
          expect(conclusion.attachment).to eq valid_params[:attachment]
          expect(conclusion.cert_expiry_date).to eq valid_params[:cert_expiry_date]
          expect(conclusion.conformity).to eq valid_params[:conformity]
          expect(conclusion.date_from).to eq valid_params[:date_from]
          expect(conclusion.desc_scheme_cert).to eq valid_params[:desc_scheme_cert]
          expect(conclusion.expert).to eq valid_params[:expert]
          expect(conclusion.list_doc_product).to eq valid_params[:list_doc_product]
          expect(conclusion.manuf_address).to eq valid_params[:manuf_address]
          expect(conclusion.manuf_doc).to eq valid_params[:manuf_doc]
          expect(conclusion.manuf_name).to eq valid_params[:manuf_name]
          expect(conclusion.manuf_postcode).to eq valid_params[:manuf_postcode]
          expect(conclusion.manuf_regulations).to eq valid_params[:manuf_regulations]
          expect(conclusion.may_be_issued).to eq valid_params[:may_be_issued]
          expect(conclusion.number).to eq valid_params[:number]
          expect(conclusion.sign_date).to eq valid_params[:sign_date]
          expect(conclusion.test_report).to eq valid_params[:test_report]
        end
      end

      context 'invalid params' do
        it 'should update the object' do
          expect { put :update, params: { id: conclusion.id, conclusion: invalid_params } }
            .not_to(change { conclusion.reload.applic_code_tn_ved })
        end
      end
    end

    context 'not signed in' do
      before { put :update, params: { id: conclusion.id, conclusion: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'delete #destroy', class: Conclusion, url: 'root'
    end

    context 'not signed in' do
      before { delete :destroy, params: { id: conclusion.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end
end
