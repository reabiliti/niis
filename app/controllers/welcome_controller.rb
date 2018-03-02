class WelcomeController < ApplicationController
  def index
    if params[:search_prop]
      @proposals = Proposal.where('prop_number LIKE ?', "%#{params[:search_prop]}%")
    else
      @proposals = Proposal.all
    end
    @setting = Setting.first
  end
end
