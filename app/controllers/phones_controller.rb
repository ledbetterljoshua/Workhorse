class PhonesController < ApplicationController
  before_action :set_phone, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @phones = Phone.all
  end

  def show
  end

  def new
    @phone = current_user.phones.build
  end

  def edit
  end

  def create
    @phone = current_user.phones.build(phone_params)
    if @phone.save
      redirect_to pages_admin_path, notice: 'phone was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @phone.update(phone_params)
      redirect_to pages_admin_path, notice: 'phone was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @phone.destroy
  redirect_to pages_admin_path
end

  private
    def set_phone
      @phone = Phone.find(params[:id])
    end

    def phone_params
      params.require(:phone).permit(:description, :phone)
    end
end
