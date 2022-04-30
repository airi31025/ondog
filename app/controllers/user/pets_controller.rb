class User::PetsController < ApplicationController
  def new
    @pet = Pet.new
  end

  def create
    pet = current_user.build_pet(pet_params)
    pet.save!
    redirect_to user_pet_path(current_user)
  end

  def show
    @pet = Pet.find(params[:id])
    @user = @pet.user
  end

  def edit
    #@user = User.find(params[:id])
    @pet = Pet.find(params[:id])
    @user = current_user
  end

  def update
    # @user = User.find(params[:id])
    # current_user.update(user_params)
    pet = Pet.find(params[:id])
    pet.update!(pet_params)
    # current_user.update(pet_params)
    redirect_to user_pet_path(pet.id)
  end

  private
  def pet_params
    params.require(:pet).permit(:name, :image, user_attributes:[:name, :email, :_destroy, :id])
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
