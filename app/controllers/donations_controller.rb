class DonationsController < ApplicationController

  def new
    @donation = Donation.new
  end

end
