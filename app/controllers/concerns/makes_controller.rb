class MakesController < ApplicationController
  def new
    @make = Make.new
  end

  def create
    @make = Make.new(make_params)
    if @make.save
      redirect_to new_make_path
      flash[:notice] = "MAKE MADE! MAKE MORE!"
    else
      flash.now[:notice] = "Practice your form form and try again!"
      render 'new'
    end
  end

  private

  def make_params
    params.require(:make).permit(:name, :country)
  end
end
