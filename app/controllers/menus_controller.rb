class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @menus = Menu.all
  end

  def show
  end

  def new
    @menu = current_user.menus.build
  end

  def edit
  end

  def create
    @menu = current_user.menus.build(menu_params)
    if @menu.save
      redirect_to pages_admin_path, notice: 'menu was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @menu.update(menu_params)
      redirect_to pages_admin_path, notice: 'menu was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @menu.destroy
  redirect_to pages_admin_path
end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:description, :image)
    end
end
