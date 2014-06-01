class AdminsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
    if @current_admin.manager?
      @admin.group = @current_admin.group
    end
  end

  def create
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:notice] = "Registration successful."
      redirect_to shops_path
    else
      render :action => 'new'
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:admin])
      flash[:notice] = "Account updated!"
      redirect_to admins_path
    else
      render :action => :edit, :id => params[:id]
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.destroy
    redirect_to admins_path
  end

end
