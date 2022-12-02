class EmergenciesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      sql_query = "title ILIKE :query OR description ILIKE :query"
      @emergencies = Emergency.includes(:donations).where(sql_query, query: "%#{params[:query]}%")
    else
      @emergencies = Emergency.includes(:donations).all
    end
  end

  def show
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
        redirect_to dashboard_path
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
      redirect_to emergency_path(@emergency)
    else
      render :update, status: :unprocessable_entity
    end
  end

  def destroy
    emergency = Emergency.find(params[:id])
    emergency.destroy
    redirect_to dashboard_path
  end

  private

  def emergency_params
    params.require(:emergency).permit(:title, :description, :fundraising_goal, photos: [])
  end
end
