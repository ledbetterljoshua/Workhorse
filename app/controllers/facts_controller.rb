class FactsController < ApplicationController
  before_action :set_fact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @facts = Fact.all
  end

  def show
  end

  def new
    @fact = current_user.facts.build
  end

  def edit
  end

  def create
    @fact = current_user.facts.build(fact_params)
    if @fact.save
      redirect_to pages_admin_path, notice: 'fact was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @fact.update(fact_params)
      redirect_to pages_admin_path, notice: 'fact was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @fact.destroy
  redirect_to pages_admin_path
end

  private
    def set_fact
      @fact = Fact.find(params[:id])
    end

    def fact_params
      params.require(:fact).permit(:hours, :pets, :happyhour, :fullbar, :bikeracks, :music, :games, :wifi, :reservations, :smoking, :parking, :whattoexpect)
    end
end
