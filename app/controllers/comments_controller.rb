class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(content: params[:content], user: User.all.sample, gossip_id: params[:gossip_id])
    if @comment.save
      flash[:notice] = "Comment successfully created"
      redirect_to gossip_path(params[:gossip_id])
    else
      render :new
    end
  end
  def edit
    @comment = Comment.find(params[:id])
  end
  def update
    @comment = Comment.find(params[:id])
    
    if @comment.update(content: params[:content], gossip_id: params[:gossip_id])
      flash[:notice] = "Comment successfully updated"    
      redirect_to gossip_path(params[:gossip_id])
    else
      render 'edit'
    end
  end
  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy
    
    flash[:notice] = "Comment successfully deleted" 
    redirect_to gossip_path(params[:gossip_id])
  end
end
