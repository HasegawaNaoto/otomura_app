class FriendlistController < ApplicationController
  before_action :friend_notice_create,{only:[:create]}
  before_action :friend_notice_destroy,{only:[:destroy]}

  def friend_notice_create
    @friend_user=User.find_by(public_uid: params[:id])
    @friend_notice=Notice.new
    @friend_notice.send_id=@current_user.id
    @friend_notice.visited_id=@friend_user.id
    @friend_notice.friended_id=@current_user.id
    @friend_notice.save
  end

  def friend_notice_destroy
    @friend_user=User.find_by(public_uid: params[:id])
    @friend_notice_1=Notice.find_by(send_id: @current_user.id,visited_id: @friend_user.id,friend_id: @current_user.id)
    if @friend_notice_1
      @friend_notice_1.destroy
    end

    @friend_notice_2=Notice.find_by(send_id: @friend_user.id,visited_id: @current_user.id,friend_id: @friend_user.id)
    if @friend_notice_2
      @friend_notice_2.destroy
    end

    @friend_notice_3=Notice.find_by(send_id: @friend_user.id,visited_id: @current_user.id,friended_id: @friend_user.id)
    if @friend_notice_3
      @friend_notice_3.destroy
    end

    @friend_notice_4=Notice.find_by(send_id: @current_user.id,visited_id: @friend_user.id,friended_id: @current_user.id)
    if @friend_notice_4
      @friend_notice_4.destroy
    end
  end

  def reply_create
    @friend_user=User.find_by(public_uid: params[:id])
    @friend_reply=Notice.new
    @friend_reply.send_id=@current_user.id
    @friend_reply.visited_id=@friend_user.id
    @friend_reply.friend_id=@current_user.id
    @friend_reply.save
    flash[:notice]="友達申請しました。"
    redirect_back(fallback_location: "/posts/index")
  end

  def reply_destroy
    @friend_user=User.find_by(public_uid: params[:id])
    @friend_reply=Notice.find_by(send_id: @current_user.id,visited_id: @friend_user.id,friend_id: @current_user.id)
    @friend_reply.destroy
    flash[:notice]="友達申請を解除しました。"
    redirect_back(fallback_location: "/posts/index")
  end

  def create
    @friend_user=User.find_by(public_uid: params[:id])
    @friend=Friendlist.new
    @friend.user_id=@current_user.id
    @friend.friend_id=@friend_user.id
    @friend.save
    @friend2=Friendlist.new
    @friend2.user_id=@friend_user.id
    @friend2.friend_id=@current_user.id
    @friend2.save
    flash[:notice]="#{@friend_user.name}さんと友達になりました。"
    redirect_back(fallback_location: "/posts/index")
  end

  def destroy
    @friend_user=User.find_by(public_uid: params[:id])
    @friendlist1=Friendlist.find_by(friend_id: @friend_user.id, user_id: @current_user.id)
    @friendlist2=Friendlist.find_by(friend_id: @current_user.id, user_id: @friend_user.id)
    @friendlist1.destroy
    @friendlist2.destroy
    flash[:notice]="友達を解除しました。"
    redirect_back(fallback_location: "/posts/index")
  end

  def friendcreate
  end

  def frienddestroy
  end
end
