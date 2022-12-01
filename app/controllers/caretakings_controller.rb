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
      redirect_to castle_booking_path(castle, booking) #where ???
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @castle = Castle.find(params[:castle_id])
    @booking = Booking.find(params[:id])
  end

  def edit
  end

  def update
  end

  def confirm!
    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to dashboard_path
  end

  def destroy
    booking = Booking.find(params[:id])
    booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:comment, :date_from, :date_to, :user_id, :castle_id)
  end
end
