class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  # add all the pages [] that we want to see without login

  def home
  end

  def dashboard
    @myshelter = current_user.shelter # equal to Shelter.where(user: current_user).first
    @shelter_animals = Animal.where(shelter: current_user.shelter)
    @shelter_caretakings = Caretaking.where(animal: @shelter_animals) # bookings the shelter has received
    @confirmed_shelter_caretakings = Caretaking.where(animal: @shelter_animals, status: 1) # confirmed bookings by shelter
    @pending_shelter_caretakings = Caretaking.where(animal: @shelter_animals, status: 0) # pending bookings to be confirmed by shelter
    @user_caretakings = Caretaking.where(user: current_user) # what the user has booked
    @shelter_emergencies = Emergency.where(animal: @shelter_animals)
    @shelter_donations = Donation.where(emergencies: @shelter_emergencies)
    @user_donations = Donation.where(user: current_user)
  end
end
