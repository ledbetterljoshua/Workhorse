class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @images = Image.all
    @instaimages = Image.last
  end

  def show
  end

  def new
    @image = current_user.images.build
  end

  def edit
  end

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      redirect_to pages_admin_path, notice: 'image was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @image.update(image_params)
      redirect_to pages_admin_path, notice: 'image was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @image.destroy
  redirect_to pages_admin_path
end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:description, :image)
    end
end
