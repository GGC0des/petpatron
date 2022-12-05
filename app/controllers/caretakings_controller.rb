class CaretakingsController < ApplicationController
  def create
    @animal = Animal.find(params[:animal_id])
    @caretaking = Caretaking.new(caretaking_params)
    @caretaking.animal = @animal
    @caretaking.user = current_user if user_signed_in?
    if @caretaking.save
      flash[:confirmation] = "your booking was made"
      redirect_to animal_path(@animal.id)
    else
      render "animals/show", status: :unprocessable_entity
    end
  end

  def show
    @animal = Animal.find(params[:animal_id])
    @caretaking = Caretaking.find(params[:id])
  end

  def confirm!
    @caretaking = Caretaking.find(params[:id])
    @caretaking.accepted!
    redirect_to dashboard_path
  end

  def destroy
    caretaking = Caretaking.find(params[:id])
    caretaking.destroy
    redirect_to dashboard_path
  end

  private

  def caretaking_params
    params.require(:caretaking).permit(:comment, :date, :animal_id, :category_id)
  end
end
