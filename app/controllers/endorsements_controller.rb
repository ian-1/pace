class EndorsementsController < ApplicationController
  def new
    @endorsement = Endorsement.new
    @user = User.find(params[:user_id])
  end

  def create
    @endorsement = Endorsement.create(endorsement_params)
    redirect_to "/users/#{params[:user_id]}"
  end

  def show
    @endorsement = Endorsement.new
  end

  private

  def endorsement_params
    params.require(:endorsement).permit(:body, :user_id, :endorser_id)
  end
end
