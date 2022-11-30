class SheltersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  def new
    @shelter = Shelter.new
  end

  def create
    shelter = Shelter.new(shelter_params)
    shelter.user = current_user if user_signed_in?
    if shelter.save
    redirect_to root_path
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
    params.require(:shelter).permit(:name, :location, :phone_number, :email, photos: [])
  end
end
