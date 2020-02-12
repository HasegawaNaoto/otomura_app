class FollowController < ApplicationController
  before_action :notice_create,{only:[:create]}
  before_action :notice_destroy,{only:[:destroy]}
  before_action :sign_in_required

  def notice_create
    @follow_user=User.find_by(public_uid: params[:id])
    @follow_notice=Notice.new
    @follow_notice.user_id=@current_user.id
    @follow_notice.visited_id=@follow_user.id
    @follow_notice.follower_id=@current_user.id
    @follow_notice.save
  end

  def notice_destroy
    @follow_user=User.find_by(public_uid: params[:id])
    @follow_notice=Notice.find_by(user_id: @current_user.id,visited_id: @follow_user.id,follower_id: @current_user.id)
    @follow_notice.destroy
  end

  def create
    @follow_user=User.find_by(public_uid: params[:id])
    @follow=Follow.new
    @follow.user_id=@current_user.id
    @follow.follow_id=@follow_user.id
    if @follow.save
      respond_to do |format|
        format.html{ redirect_back(fallback_location: "/posts/index") }
        format.js{ render "follow/create.js.erb"}
      end
    end
  end

  def destroy
    @follow_user=User.find_by(public_uid: params[:id])
    @follow=Follow.find_by(follow_id: @follow_user.id,user_id: @current_user.id)
    if @follow.destroy
        respond_to do |format|
          format.html{ redirect_back(fallback_location: "/posts/index") }
          format.js{ render "follow/destroy.js.erb" }
        end
      end
    end
  end
