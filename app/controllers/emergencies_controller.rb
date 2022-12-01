class EmergenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @emergencies = Emergency.includes(:donations).all
  end

  def show
    @emergency = Emergency.find(params[:id])
    @donation = Donation.new
  end

  private

  def emergency_params
    params.require(:emergency).permit(:title, :description, :fundraising_goal, photos: [])
  end
end
