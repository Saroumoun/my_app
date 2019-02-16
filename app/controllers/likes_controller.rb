class LikesController < ApplicationController
	before_action :authenticate_user, only: [:create, :destroy]

	def create
		@like = Like.new(gossip_id: params[:gossip_id], user: current_user)

		if already_liked?
    	flash[:danger] = "You can't like more than once"
  	else
  	  @like.save
      flash[:notice] = "You liked that gossip"
  	end
  	redirect_back(fallback_location: root_path)
	end

	def destroy
		@like = Like.find(params[:id])
		if !(already_liked?)
    	flash[:danger] = "Cannot unlike"
  	else
    	@like.destroy
    	flash[:notice] = "You unliked that gossip"
  	end
  	redirect_back(fallback_location: root_path)
	end

	private 

	def authenticate_user
    unless current_user
      flash[:danger] = "You need to log in"
      redirect_to new_session_path
    end
  end

  def already_liked?
  	Like.where(user_id: current_user.id, gossip_id: params[:gossip_id]).exists?
	end
end
