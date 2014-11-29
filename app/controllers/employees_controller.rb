class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  


  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @employee = current_user.employees.build
  end

  def edit
  end

  def create
    @employee = current_user.employees.build(employee_params)
    if @employee.save
      redirect_to pages_admin_path, notice: 'employee was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @employee.update(employee_params)
      redirect_to pages_admin_path, notice: 'employee was successfully updated.'
    else
      render action: 'edit'
    end
  end

def destroy
    @employee.destroy
  redirect_to pages_admin_path
end

  private
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      params.require(:employee).permit(:description, :image, :link)
    end
end
