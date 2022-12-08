class SheltersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query"
      @all_names = Shelter.all.pluck(:name).join(",").downcase
      @all_locations = Shelter.all.pluck(:location).join(",").downcase
      if @all_locations.include? params[:query].downcase
        @shelters = Shelter.where(sql_query, query: "%#{params[:query]}%")
      elsif @all_names.include? params[:query].downcase
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
        lng: shelter.longitude,
        info_window: render_to_string(partial: "info_window", locals: { shelter: shelter }),
        image_url: "/marker.png"
      }
    end
  end

  def show
    @shelter = Shelter.find(params[:id])

    @markers = [{
      lat: @shelter.latitude,
      lng: @shelter.longitude,
      info_window: render_to_string(partial: "info_window", locals: { shelter: @shelter }),
      image_url: "/marker.png"
    }]
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
    if current_user.shelter.present? && @shelter.update(shelter_params)
      redirect_to dashboard_path
    else
      # to show error if any input was left blank
      # and to stay in the same page of the form
      render :edit, status: :unprocessable_entity
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
