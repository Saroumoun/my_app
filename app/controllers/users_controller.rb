class UsersController < ApplicationController
	def index
    @users = User.all
    # puts "-" * 30
    # puts params
    # puts "-" * 30
  end

  def show
    # puts "-*" * 30
    # puts params
    # puts "-*" * 30
    @users = User.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
