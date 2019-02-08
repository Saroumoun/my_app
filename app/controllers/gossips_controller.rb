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
    # puts "-*" * 30
    # puts params
    # puts "-*" * 30
    @gossips = Gossip.new
  end

  def create
    puts "-*" * 30
    puts params
    puts "-*" * 30
    # @gossips = Gossip.new()
    # if @gossips.save
    #   redirect_to @gossip
    # else
    #   render :new
    # end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
