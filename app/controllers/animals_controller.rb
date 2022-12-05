class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "name ILIKE :query OR location ILIKE :query"
      @all_locations = Shelter.all.pluck(:location).join(",")
      if @all_locations.include? params[:query].to_s.capitalize
        @shelters = Shelter.where(sql_query, query: "%#{params[:query]}%")
        @all_animals = Animal.all
        @animals = []
        @all_animals.each do |animal|
          if @shelters.include? animal.shelter
            @animals << animal
          end
        end
        @markers = @shelters.geocoded.map do |shelter|
          {
            lat: shelter.latitude,
            lng: shelter.longitude,
            info_window: render_to_string(partial: "info_window", locals: {shelter: shelter})
          }
        end
      else
        @shelters = Shelter.all
        @animals = Animal.all
      end
    else
      @shelters = Shelter.all
      @animals = Animal.all
    end
    @markers = @shelters.geocoded.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude,
        info_window: render_to_string(partial: "info_window", locals: {shelter: shelter}),
        image_url: helpers.asset_url("marker")
      }
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @caretaking = Caretaking.new
    store_location_for(:user, animal_path(params[:id]))
    @shelters = Shelter.all
    @markers = @shelters.geocoded.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude
      }
    end
  end

  def new
    if user_signed_in? && current_user.shelter.present?
      @animal = Animal.new
    else
      flash[:warning] = "Sorry, you are not a shelter owner"
      redirect_to dashboard_path
    end
  end

  def create
    if user_signed_in?
      @animal = Animal.new(animal_params)
      @animal.shelter = current_user.shelter
      animal_categories = params[:animal][:category_ids].reject { |category| category.empty? }
      animal_categories.each do |category|
        AnimalCategory.create(animal: @animal, category_id: category)
      end
      if @animal.save
        redirect_to dashboard_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    if user_signed_in? && current_user.shelter.present?
      @animal = Animal.find(params[:id])
    else
      flash[:warning] = "Sorry, you are not a shelter owner"
    end
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    redirect_to dashboard_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :sex, :size, :species, :categories, append_photos: [])
  end
end
