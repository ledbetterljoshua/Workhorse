class LogosController < ApplicationController
  before_action :set_logo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @logos = Logo.all
  end

  def show
  end

  def new
    @logo = current_user.logos.build
  end

  def edit
  end

  def create
    @logo = current_user.logos.build(logo_params)
    if @logo.save
      redirect_to pages_admin_path, notice: 'logo was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @logo.update(logo_params)
      redirect_to pages_admin_path, notice: 'logo was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @logo.destroy
  redirect_to pages_admin_path
end

  private
    def set_logo
      @logo = Logo.find(params[:id])
    end

    def logo_params
      params.require(:logo).permit(:description, :image, :link)
    end
end
