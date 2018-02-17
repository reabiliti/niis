class WelcomeController < ApplicationController
  def index
    @setting = Setting.first
    @proposals = Proposal.all
  end
end
