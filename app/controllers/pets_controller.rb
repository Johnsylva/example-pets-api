class PetsController < ApplicationController
  before_action :authenticate_user, except: [:index]


  def index
    @pets = Pet.all
    render :index

    pp current_user
  end

  def create
    @pet = Pet.create(
      name: params[:name],
      age: params[:age],
      breed: params[:breed],
      user_id: current_user.id
    )

    render :show
  end
end
