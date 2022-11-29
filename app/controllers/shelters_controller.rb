class SheltersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @shelters = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :location, :phone_number, :email, photos: [])
  end
end
