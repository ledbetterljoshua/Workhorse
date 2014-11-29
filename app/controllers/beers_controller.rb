class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @beers = Beer.all
  end

  def show
  end

  def new
    @beer = current_user.beers.build
  end

  def edit
  end

  def create
    @beer = current_user.beers.build(beer_params)
    if @beer.save
      redirect_to pages_admin_path, notice: 'beer was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @beer.update(beer_params)
      redirect_to pages_admin_path, notice: 'beer was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @beer.destroy
  redirect_to pages_admin_path
end

  private
    def set_beer
      @beer = Beer.find(params[:id])
    end

    def beer_params
      params.require(:beer).permit(:description, :image, :link)
    end
end
