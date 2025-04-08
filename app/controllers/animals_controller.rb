class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "
        animals.species ILIKE :query
        OR shelters.location ILIKE :query
        OR categories.name ILIKE :query
        OR animals.name ILIKE :query
      "
      # fixing error happen when selecting category and searching with words having typos
      if params[:categories]
        @categories = Category.where(name: params[:categories]).pluck(:id).join(",")
        sql_query = "(#{sql_query}) AND categories.id IN (#{@categories})"
      end
      # to get results from searching by name
      @items = Animal.joins(:shelter, :categories).where(sql_query, query: "%#{params[:query]}%").distinct
      # .distinct to avoid repeated result
      if @items.first.is_a?(Animal)
        @animals = @items
        @shelters = @items.map{|animal|animal.shelter}
      elsif @items.first.is_a?(Category)
        @animals = @items.map{|category|category.animals}
        @shelters = @animals.map{|animal|animal.shelter}
      else
        @shelters = @items
      end
    else
      @shelters = Shelter.all
      @animals = Animal.all
    end

    @markers = @shelters.map do |shelter|
      {
        lat: shelter.latitude,
        lng: shelter.longitude,
        info_window: render_to_string(partial: "info_window", locals: {shelter: shelter}),
        image_url: "/marker.png"
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
      if @animal.save
        animal_categories = params[:animal][:category_ids].reject { |category| category.empty? }
        animal_categories.each do |category|
          AnimalCategory.create(animal: @animal, category_id: category)
        end
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
      # to show error if any input was left blank
      # and to stay in the same page of the form
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    animal = Animal.find(params[:id])
    animal.destroy
    redirect_to dashboard_path
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :sex, :size, :species, :animal_categories, :categories, append_photos: [])
  end
end
