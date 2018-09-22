# frozen_string_literal: true

require 'rails_helper'

describe SolutionProposalsController, type: :controller do
  render_views

  let!(:proposal) { create(:proposal) }
  let!(:setting) { create(:setting) }
  let!(:solution_proposal) { create(:solution_proposal) }
  let!(:user) { create(:user) }
  let!(:valid_params) do
    {
      add_info: 'new_add_info',
      applic_code_okp: 'new_applic_code_okp',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_name: 'new_applic_name',
      applic_name_product: 'new_applic_name_product',
      applic_sign: true,
      basis_work: 'new_basis_work',
      date_from: Date.new,
      desc_scheme_cert: 'new_desc_scheme_cert',
      executor: 'new_executor',
      expert: 'new_expert',
      list_doc_product: 'new_list_doc_product',
      manuf_address: 'new_manuf_address',
      manuf_doc: 'new_manuf_doc',
      manuf_list_doc: 'new_manuf_list_doc',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      number: 'new_number',
      os_chief_name: 'new_os_chief_name',
      os_chief_position: 'new_os_chief_position',
      sampling: 'new_sampling',
      solution: 'new_solution',
      test_lab: 'new_test_lab',
      proposal_id: proposal.id
    }
  end
  let!(:invalid_params) do
    {
      add_info: 'new_add_info',
      applic_code_okp: 'new_applic_code_okp',
      applic_code_tn_ved: 'new_applic_code_tn_ved',
      applic_name: 'new_applic_name',
      applic_name_product: 'new_applic_name_product',
      applic_sign: true,
      basis_work: 'new_basis_work',
      date_from: nil,
      desc_scheme_cert: 'new_desc_scheme_cert',
      executor: 'new_executor',
      expert: 'new_expert',
      list_doc_product: 'new_list_doc_product',
      manuf_address: 'new_manuf_address',
      manuf_doc: 'new_manuf_doc',
      manuf_list_doc: 'new_manuf_list_doc',
      manuf_name: 'new_manuf_name',
      manuf_postcode: 'new_manuf_postcode',
      manuf_regulations: 'new_manuf_regulations',
      number: 'new_number',
      os_chief_name: 'new_os_chief_name',
      os_chief_position: 'new_os_chief_position',
      sampling: 'new_sampling',
      solution: 'new_solution',
      test_lab: 'new_test_lab',
      proposal_id: proposal.id
    }
  end

  describe 'GET #new' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #new', class: SolutionProposal, parent: Proposal
    end

    context 'not signed in' do
      before { get :new }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #show' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #show', class: SolutionProposal
    end

    context 'not signed in' do
      before { get :show, params: { id: solution_proposal.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'POST #create' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'post #create', class: SolutionProposal
    end

    context 'not signed in' do
      before { post :create, params: { solution_proposal: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'GET #edit' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'get #edit', class: SolutionProposal
    end

    context 'not signed in' do
      before { get :edit, params: { id: solution_proposal.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'PUT #update' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'put #update', class: SolutionProposal

      context 'valid params' do
        before { put :update, params: { id: solution_proposal.id, solution_proposal: valid_params } }

        it 'should update the object' do
          solution_proposal.reload
          expect(solution_proposal.add_info).to eq valid_params[:add_info]
          expect(solution_proposal.applic_code_okp).to eq valid_params[:applic_code_okp]
          expect(solution_proposal.applic_code_tn_ved).to eq valid_params[:applic_code_tn_ved]
          expect(solution_proposal.applic_name).to eq valid_params[:applic_name]
          expect(solution_proposal.applic_name_product).to eq valid_params[:applic_name_product]
          expect(solution_proposal.applic_sign).to eq valid_params[:applic_sign]
          expect(solution_proposal.basis_work).to eq valid_params[:basis_work]
          expect(solution_proposal.date_from).to eq valid_params[:date_from]
          expect(solution_proposal.desc_scheme_cert).to eq valid_params[:desc_scheme_cert]
          expect(solution_proposal.executor).to eq valid_params[:executor]
          expect(solution_proposal.expert).to eq valid_params[:expert]
          expect(solution_proposal.list_doc_product).to eq valid_params[:list_doc_product]
          expect(solution_proposal.manuf_address).to eq valid_params[:manuf_address]
          expect(solution_proposal.manuf_doc).to eq valid_params[:manuf_doc]
          expect(solution_proposal.manuf_list_doc).to eq valid_params[:manuf_list_doc]
          expect(solution_proposal.manuf_name).to eq valid_params[:manuf_name]
          expect(solution_proposal.manuf_postcode).to eq valid_params[:manuf_postcode]
          expect(solution_proposal.manuf_regulations).to eq valid_params[:manuf_regulations]
          expect(solution_proposal.number).to eq valid_params[:number]
          expect(solution_proposal.os_chief_name).to eq valid_params[:os_chief_name]
          expect(solution_proposal.os_chief_position).to eq valid_params[:os_chief_position]
          expect(solution_proposal.sampling).to eq valid_params[:sampling]
          expect(solution_proposal.solution).to eq valid_params[:solution]
          expect(solution_proposal.test_lab).to eq valid_params[:test_lab]
        end
      end

      context 'invalid params' do
        it 'should update the object' do
          expect { put :update, params: { id: solution_proposal.id, solution_proposal: invalid_params } }
            .not_to(change { solution_proposal.reload.applic_name })
        end
      end
    end

    context 'not signed in' do
      before { put :update, params: { id: solution_proposal.id, solution_proposal: valid_params } }

      it_behaves_like 'redirects to', 'login'
    end
  end

  describe 'DELETE #destroy' do
    context 'signed in' do
      before { login_user(user) }

      it_behaves_like 'delete #destroy', class: SolutionProposal, url: 'root'
    end

    context 'not signed in' do
      before { delete :destroy, params: { id: solution_proposal.id } }

      it_behaves_like 'redirects to', 'login'
    end
  end
end
