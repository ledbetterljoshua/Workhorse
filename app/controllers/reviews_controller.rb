class ReviewsController < ApplicationController
  before_action :set_reviews, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @reviews = current_user.reviews.build
  end

  def edit
  end

  def create
    @reviews = current_user.reviews.build(reviews_params)
    if @reviews.save
      redirect_to pages_admin_path, notice: 'reviews was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @reviews.update(reviews_params)
      redirect_to pages_admin_path, notice: 'reviews was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @reviews.destroy
  redirect_to pages_admin_path
end

  private
    def set_reviews
      @reviews = Review.find(params[:id])
    end

    def reviews_params
      params.require(:reviews).permit(:description, :reviews)
    end
end
