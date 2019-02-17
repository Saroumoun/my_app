class UsersController < ApplicationController
	def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], password: params[:password], age: params[:age].to_i, description: params[:description], city: City.all.sample)
    if @user.save
      log_in(@user)
      flash[:notice] = "Account successfully created"
      redirect_to root_path
    else
      render :new
    end
  end
end
