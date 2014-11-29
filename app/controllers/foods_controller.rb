class FoodsController < ApplicationController
  before_action :set_food, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @foods = Food.all
  end

  def show
  end

  def new
    @food = current_user.foods.build
  end

  def edit
  end

  def create
    @food = current_user.foods.build(food_params)
    if @food.save
      redirect_to pages_admin_path, notice: 'food was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @food.update(food_params)
      redirect_to pages_admin_path, notice: 'food was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @food.destroy
    redirect_to pages_admin_path
  end
  private
    def set_food
      @food = Food.find(params[:id])
    end

    def food_params
      params.require(:food).permit(:description, :image)
    end
end
