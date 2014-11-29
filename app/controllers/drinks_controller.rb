class DrinksController < ApplicationController
  before_action :set_drink, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @drinks = Drink.all
  end

  def show
  end

  def new
    @drink = current_user.drinks.build
  end

  def edit
  end

  def create
    @drink = current_user.drinks.build(drink_params)
    if @drink.save
      redirect_to pages_admin_path, notice: 'drink was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @drink.update(drink_params)
      redirect_to pages_admin_path, notice: 'drink was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @drink.destroy
    redirect_to pages_admin_path
  end
  private
    def set_drink
      @drink = Drink.find(params[:id])
    end

    def drink_params
      params.require(:drink).permit(:description, :image)
    end
end
