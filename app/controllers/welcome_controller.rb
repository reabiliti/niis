# frozen_string_literal: true

# This controller for search and all proposals
class WelcomeController < ApplicationController
  def index
    @proposals = ProposalsQuery.new.call.search params[:search], params[:page]
    @setting = Setting.first
  end
end
