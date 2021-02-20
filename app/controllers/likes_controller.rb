class LikesController < ApplicationController

  def create
    @like = current_user.likes.create(movie_comment_id: params[:movie_comment_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @like = Like.find_by(movie_comment_id: params[:movie_comment_id], user_id: current_user.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
