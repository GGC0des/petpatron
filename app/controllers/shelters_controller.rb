class SheltersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query"
      @all_locations = Shelter.all.pluck(:location).join(",")
      if @all_locations.include? params[:query].to_s.capitalize
        @shelters = Shelter.where(sql_query, query: "%#{params[:query]}%")
      else
        @shelters = Shelter.all
      end
    else
      @shelters = Shelter.all
    end
    @markers = @shelters.geocoded.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude
      }
    end
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    redirect_to dashboard_path if current_user.shelter.present?
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(shelter_params)
    @shelter.user = current_user if user_signed_in?
    if @shelter.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shelter = Shelter.find(params[:id]) # only owner can edit !
  end

  def update
    @shelter = Shelter.find(params[:id])
    if current_user.shelter.present?
      @shelter.update(shelter_params)
      redirect_to shelter_path(@shelter)
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    shelter = Shelter.find(params[:id])
    shelter.destroy
    redirect_to dashboard_path
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :description, :location, :phone_number, :email, append_photos: [])
  end
end
