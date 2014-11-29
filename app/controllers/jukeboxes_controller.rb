class JukeboxesController < ApplicationController
  before_action :set_jukebox, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @jukeboxes = Jukebox.all
  end

  def show
  end

  def new
    @jukebox = current_user.jukeboxs.build
  end

  def edit
  end

  def create
    @jukebox = current_user.jukeboxes.build(jukebox_params)
    if @jukebox.save
      redirect_to pages_admin_path, notice: 'jukebox was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @jukebox.update(jukebox_params)
      redirect_to pages_admin_path, notice: 'jukebox was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @jukebox.destroy
  redirect_to pages_admin_path
end

  private
    def set_jukebox
      @jukebox = Jukebox.find(params[:id])
    end

    def jukebox_params
      params.require(:jukebox).permit(:description, :jukebox)
    end
end
