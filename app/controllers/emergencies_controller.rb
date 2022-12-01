class EmergenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @emergencies = Emergency.includes(:donations).all
  end

  def show
    @emergency = Emergency.find(params[:id])
    @donation = Donation.new
  end

  def new
    if user_signed_in? && current_user.shelter.present?
      @emergency = Emergency.new
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

  def emergency_params
    params.require(:emergency).permit(:title, :description, :fundraising_goal, photos: [])
  end
end
