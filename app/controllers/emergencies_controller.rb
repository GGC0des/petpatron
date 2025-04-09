class EmergenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "
        emergencies.title ILIKE :query
        OR shelters.location ILIKE :query
        OR shelters.name ILIKE :query
        "


      # Get shelters and their associated animals and emergencies
      @shelters = Shelter.joins(animals: :emergencies)
          .where(sql_query, query: "%#{params[:query]}%")
          .distinct

      # Fetch all emergencies associated with these shelters
      @emergencies = Emergency.joins(:animal => :shelter)
          .where(sql_query, query: "%#{params[:query]}%")
          .distinct

    else
    # If no query fetch all shelters that have animals with emergencies
      @shelters = Shelter.joins(animals: :emergencies).distinct
      @emergencies = Emergency.joins(:animal).distinct
    end

    # Collect the locations of the shelters for Mapbox
    @shelter_locations = @shelters.map do |shelter|
      {
        name: shelter.name,
        location: shelter.location,
        latitude: shelter.latitude,
        longitude: shelter.longitude
      }
    end

    # Collect emergency-related information for display
    @emergency_locations = @emergencies.map do |emergency|
      shelter = emergency.animal.shelter
      {
        emergency_id: emergency.id,
        title: emergency.title,
        shelter_name: shelter.name,
        location: shelter.location,
        latitude: shelter.latitude,
        longitude: shelter.longitude
      }
    end

    # For Mapbox or any map-related display, fetch locations of all shelters
    @markers = @shelter_locations.map do |shelter_location|
      {
        lat: shelter_location[:latitude],
        lng: shelter_location[:longitude],
        info_window: render_to_string(partial: "info_window", locals: { shelter: Shelter.find_by(name: shelter_location[:name]) }),
        image_url: "/marker.png"
      }
    end
  end

  def show
    @donated = params[:donated].present?
    @emergency = Emergency.find(params[:id])
    @fgoal = @emergency.fundraising_goal
    @sum_of_donations = @emergency.donations.sum(:donation_amount)
    @donations = @emergency.donations
  end

  def new
    if user_signed_in? && current_user.shelter.present?
      @animal = Animal.find(params[:animal_id])
      @emergency = Emergency.new(animal: @animal)
    else
      flash[:warning] = "Sorry, you are not a shelter owner"
      redirect_to dashboard_path
    end
  end

  def create
    if user_signed_in?
      @animal = Animal.find(params[:animal_id])
      @emergency = Emergency.new(emergency_params)
      @emergency.animal = @animal
      if @emergency.save
        redirect_to emergency_path(@emergency)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    if user_signed_in? && current_user.shelter.present?
      @emergency = Emergency.find(params[:id])
    else
      flash[:warning] = "Sorry, you are not a shelter owner"
    end
  end

  def update
    @emergency = Emergency.find(params[:id])
    if @emergency.update(emergency_params)
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    emergency = Emergency.find(params[:id])
    emergency.destroy
    redirect_to dashboard_path
  end

  private

  def emergency_params
    params.require(:emergency).permit(:animal_id, :title, :description, :fundraising_goal, photos: [])
  end
end
