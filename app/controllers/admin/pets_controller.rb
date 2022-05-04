class Admin::PetsController < ApplicationController
  def index
    @users = User.all
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
    @user = @pet.user
  end
end
