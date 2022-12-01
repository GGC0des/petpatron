class CaretakingsController < ApplicationController

  def new
    @animal = Animal.find(params[:animal_id])
    @caretaking = Caretaking.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @caretaking = Caretaking.new(caretaking_params)
    caretaking.animal = animal
    caretaking.user = current_user if user_signed_in?
    if caretaking.save!
      redirect_to animal_caretaking_path(animal, caretaking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @animal = Animal.find(params[:castle_id])
    @caretaking = Caretaking.find(params[:id])
  end

  def confirm!
    @caretaking = Caretaking.find(params[:id])
    @caretaking.accepted = true
    @caretaking.save
    redirect_to dashboard_path
  end

  def destroy
    caretaking = Caretaking.find(params[:id])
    caretaking.destroy
    redirect_to dashboard_path
  end

  private

  def caretaking_params
    # change params ! 
    params.require(:caretaking).permit(:comment, :date_from, :date_to, :user_id, :castle_id)
  end
end
