class DonationsController < ApplicationController

  def new
    @emergency = Emergency.find(params[:emergency_id])
    @donation = Donation.new
  end

  def create
    @emergency = Emergency.find(params[:emergency_id])
    @donation = Donation.new(donation_params)
    @donation.emergency = @emergency
    @donation.user = current_user if user_signed_in?
    if @donation.save!
      redirect_to emergency_path(@emergency)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:comment, :donation_amount)
  end
end
