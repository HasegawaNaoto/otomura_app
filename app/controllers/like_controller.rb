class LikeController < ApplicationController
  before_action :like_notice_create,{only:[:create]}
  before_action :like_notice_destroy,{only:[:destroy]}

  def like_notice_create
    if @current_user
      @post=Post.find_by(id: params[:id])
      @notice=Notice.new
      @notice.send_id=@current_user.id
      @notice.visited_id=@post.user_id
      @notice.like_id=@post.id
      @notice.save
    end
  end

  def like_notice_destroy
    if @current_user
      @post=Post.find_by(id: params[:id])
      @notice=Notice.find_by(send_id: @current_user.id,visited_id: @post.user_id,like_id: @post.id)
      @notice.destroy
    end
  end

  def create
    @posts=Post.find_by(id: params[:id])
    @likes=Like.new(user_id:@current_user.id,post_id:@posts.id)
    @likes.save
  end

  def destroy
    @posts=Post.find_by(id: params[:id])
    @likes=Like.find_by(user_id:@current_user.id,post_id:@posts.id)
    @likes.destroy
  end
end
