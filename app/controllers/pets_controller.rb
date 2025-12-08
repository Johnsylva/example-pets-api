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
      breed: params[:breed]
    )

    render :show
  end
end
