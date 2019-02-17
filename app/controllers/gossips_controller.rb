class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:new, :edit, :destroy]
  before_action :verify_user_rights, only: [:edit, :destroy]


  def index
    @gossips = Gossip.all
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def new
      @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: current_user)
    if @gossip.save
      flash[:notice] = "Gossip successfully created"
      redirect_to @gossip
    else
      render :new
    end
  end

  def edit
      @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    params_permitted = params.require(:gossip).permit(:title, :content)

    if @gossip.update(params_permitted)
      flash[:notice] = "Gossip successfully updated"
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])

    @gossip.destroy

    flash[:notice] = "Gossip successfully deleted"
    redirect_to root_path
  end

  private 

  def authenticate_user
    unless current_user
      flash[:danger] = "You need to log in"
      redirect_to new_session_path
    end
  end

  def verify_user_rights
    unless current_user == Gossip.find(params[:id]).user
      flash[:danger] = "You are not the author"
      redirect_to root_path
    end
  end
end
