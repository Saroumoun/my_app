class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]
  before_action :verify_user_rights, only: [:edit, :update, :destroy]

  def new
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @comment = Comment.new
    end
  end

  def create
    @comment = Comment.new(content: params[:content], user: current_user, gossip_id: params[:gossip_id])
    if @comment.save
      flash[:notice] = "Comment successfully created"
      redirect_to gossip_path(params[:gossip_id])
    else
      render :new
    end
  end

  def edit    
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @comment = Comment.find(params[:id])
    end
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
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    else
      @comment = Comment.find(params[:id])

      @comment.destroy
      
      flash[:notice] = "Comment successfully deleted" 
      redirect_to gossip_path(params[:gossip_id])
    end
  end

  private

  def authenticate_user
    unless current_user
      flash[:danger] = "You need to log in"
      redirect_to new_session_path
    end
  end

  def verify_user_rights
    unless current_user == Comment.find(params[:id]).user
      flash[:danger] = "You are not the author"
      redirect_to root_path
    end
  end
end
