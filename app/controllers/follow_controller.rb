class FollowController < ApplicationController
  before_action :notice_create,{only:[:create]}
  before_action :notice_destroy,{only:[:destroy]}

  def notice_create
    @follow_user=User.find_by(public_uid: params[:id])
    @follow_notice=Notice.new
    @follow_notice.send_id=@current_user.id
    @follow_notice.visited_id=@follow_user.id
    @follow_notice.follower_id=@current_user.id
    @follow_notice.save
  end

  def notice_destroy
    @follow_user=User.find_by(public_uid: params[:id])
    @follow_notice=Notice.find_by(send_id: @current_user.id,visited_id: @follow_user.id,follower_id: @current_user.id)
    @follow_notice.destroy
  end

  def create
    @follow_user=User.find_by(public_uid: params[:id])
    @follow=Follow.new
    @follow.follow_id=@follow_user.id
    @follow.user_id=@current_user.id
    @follow.save
    @follower=Follow.new
    @follower.follower_id=@current_user.id
    @follower.user_id=@follow_user.id
    @follower.save
    redirect_back(fallback_location: "/posts/index")
  end

  def destroy
    @follow_user=User.find_by(public_uid: params[:id])
    @follow=Follow.find_by(follow_id: @follow_user.id,user_id: @current_user.id)
    @follow.destroy
    @follower=Follow.find_by(follower_id: @current_user.id,user_id: @follow_user.id)
    @follower.destroy
    redirect_back(fallback_location: "/posts/index")
  end
end
