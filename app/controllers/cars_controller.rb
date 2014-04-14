class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to new_car_path
      flash[:notice] = "Your car addition has gotten a 'GREEN LIGHT', AS IT WERE"
    else
      flash.now[:notice] = "*HONK SCREECH CRASH BOOM* CHECK YOUR BLIND SPOT YOU MADE MISTAKES"
      render 'new'
    end
  end

  private

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description)
  end
end
