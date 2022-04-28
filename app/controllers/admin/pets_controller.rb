class Admin::PetsController < ApplicationController
  def index
    @users = User.all
    @pets = Pet.all
  end

  def show
  end
end
