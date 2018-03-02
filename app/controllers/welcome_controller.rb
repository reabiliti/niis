class WelcomeController < ApplicationController

  def index
    @proposals = Proposal.search(params[:search], params[:page])
    @setting = Setting.first
  end

end
