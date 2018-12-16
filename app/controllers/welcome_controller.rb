# frozen_string_literal: true

# This controller for search and all proposals
class WelcomeController < ApplicationController
  def index
    @proposals = FilterProposalsQuery.new(initial_scope: AllProposalsQuery.new.call, params: params).call
    @setting = Setting.first
  end
end
