class GossipsController < ApplicationController
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
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.all.sample)
    if @gossip.save
      flash[:notice] = "Gossip successfully created"
      redirect_to @gossip
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
