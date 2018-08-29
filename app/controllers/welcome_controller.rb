# frozen_string_literal: true

# This controller for search and all proposals
class WelcomeController < ApplicationController
  before_action :logged_in_user

  def index
    @proposals = Proposal.search params[:search], params[:page]
    @setting = Setting.first
  end
end
