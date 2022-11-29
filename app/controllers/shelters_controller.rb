class SheltersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @shelter = Shelter.all
  end

  def show
    @shelter = Shelter.find(params[:id])
  end

  private

  def shelter_params
    params.require(:shelter).permit(:name, :location, :phone_number, :email) #photos: [] add this with Cloudinary !
  end
end
