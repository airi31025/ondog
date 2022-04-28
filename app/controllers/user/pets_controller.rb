class User::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    pet = Pet.new(pet_params)
    pet.save
    redirect_to user_pet_path(current_user)
  end

  def show
    @user = User.find(params[:id])
    @pet = Pet.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @pet = Pet.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    pet = Pet.find(params[:id])
    pet.update(pet_params)
    redirect_to user_pet_path(pet.id)
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :image)
  end

end
