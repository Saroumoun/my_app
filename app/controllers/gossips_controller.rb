class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
  end

  def show
    @gossips = Gossip.find(params[:id])
  end

  def new
    @gossips = Gossip.new
  end

  def create
    puts "-*" * 30
    puts params
    puts "-*" * 30
    @gossips = Gossip.new(title: params[:title], content: params[:content], user: User.all.sample)
    if @gossips.save
      flash[:notice] = "Gossip successfully created"
      redirect_to @gossips
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
