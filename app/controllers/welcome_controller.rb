class WelcomeController < ApplicationController
  def index
    @setting = Setting.first
    @proposals = Proposal.all
    @solution_proposals = SolutionProposal.all
    @protocols = Protocol.all
  end
end
