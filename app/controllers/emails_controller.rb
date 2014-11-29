class EmailsController < ApplicationController
  before_action :set_email, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @emails = Email.all
  end

  def show
  end

  def new
    @email = current_user.emails.build
  end

  def edit
  end

  def create
    @email = current_user.emails.build(email_params)
    if @email.save
      redirect_to pages_admin_path, notice: 'email was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @email.update(email_params)
      redirect_to pages_admin_path, notice: 'email was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @email.destroy
  redirect_to pages_admin_path
end

  private
    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:description, :image)
    end
end
