class EmergenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @emergencies = Emergency.includes(:donations).all
  end

  def show
    @emergency = Emergency.find(params[:id])
    @fgoal = @emergency.fundraising_goal
    @sum_of_donations = @emergency.donations.sum(:donation_amount)
    @donations = @emergency.donations
  end

  private

  def emergency_params
    params.require(:emergency).permit(:title, :description, :fundraising_goal, photos: [])
  end
end
