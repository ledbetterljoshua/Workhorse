class AddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @addresses = Address.all
  end

  def show
  end

  def new
    @address = current_user.addresses.build
  end

  def edit
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      redirect_to pages_admin_path, notice: 'address was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @address.update(address_params)
      redirect_to pages_admin_path, notice: 'address was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @address.destroy
    redirect_to pages_admin_path
  end
  private
    def set_address
      @address = Address.find(params[:id])
    end

    def address_params
      params.require(:address).permit(:description, :image)
    end
end