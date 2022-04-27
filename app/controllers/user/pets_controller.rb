class User::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.save
    redirect_to user_pet_path
  end

  def show
    @user = User.find(params[:id])
    @pet = Pet.find(params[:id])
  end

  def edit
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :image)
  end

end
