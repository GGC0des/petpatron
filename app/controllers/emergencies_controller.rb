class EmergenciesController < ApplicationController

  def index
    @emergencies = Emergency.all
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
