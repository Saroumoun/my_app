class GossipsController < ApplicationController
  def index
    @gossips = Gossip.all
    # puts "-" * 30
    # puts params
    # puts "-" * 30
  end

  def show
    # puts "-*" * 30
    # puts params
    # puts "-*" * 30
    @gossips = Gossip.find(params[:id])
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
