# frozen_string_literal: true

# This controller for search and all proposals
class WelcomeController < ApplicationController
  def index
    @proposals = Proposal.includes(:solution_proposal).search params[:search], params[:page]
    @setting = Setting.first
  end
end
