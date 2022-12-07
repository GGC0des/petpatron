class DonationsController < ApplicationController
  def new
    @emergency = Emergency.find(params[:emergency_id])
    @donation = Donation.new
    @fgoal = @emergency.fundraising_goal
    @sum_of_donations = @emergency.donations.sum(:donation_amount)
    @donations = @emergency.donations
  end

  def create
    @emergency = Emergency.find(params[:emergency_id])
    @donation = Donation.new(donation_params)
    @donation.emergency = @emergency
    @donation.user = current_user if user_signed_in?
    if @donation.save!
      flash[:confirmation] = @donation.donation_amount
      redirect_to emergency_path(@emergency, donated: true)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def donation_params
    params.require(:donation).permit(:comment, :donation_amount)
  end
end
