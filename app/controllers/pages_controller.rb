class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :about, :career ]
  # add all the pages [] that we want to see without login

  def home
  end

  def dashboard
    @myshelter = current_user.shelter # equal to Shelter.where(user: current_user).first
    @shelter_animals = Animal.where(shelter: current_user.shelter)
    @shelter_caretakings = Caretaking.where(animal: @shelter_animals).order(:date) # bookings the shelter has received
    @confirmed_shelter_caretakings = Caretaking.where(animal: @shelter_animals, status: 1) # confirmed bookings by shelter
    @pending_shelter_caretakings = Caretaking.where(animal: @shelter_animals, status: 0) # pending bookings to be confirmed by shelter
    @user_caretakings = Caretaking.where(user: current_user) # what the user has booked
    @user_confirmed_caretakings = Caretaking.where(user: current_user, status: 1) # what the user has booked, confirmed
    @user_pending_caretakings = Caretaking.where(user: current_user, status: 0) # what the user has booked, pending
    @shelter_emergencies = Emergency.where(animal: @shelter_animals)
    @shelter_donations = Donation.where(emergencies: @shelter_emergencies)
    @user_donations = Donation.where(user: current_user)
    if @myshelter.present?
      @markers = {
        lat: @myshelter.latitude,
        lng: @myshelter.longitude,
        info_window: render_to_string(partial: "info_window", locals: { shelter: @myshelter }),
        image_url: "/marker.png"
      }
    end
  end

  def about
  end

  def career
  end

end
