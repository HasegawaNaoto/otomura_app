class UsersController < ApplicationController
  before_action :recomended_user,{only:[:userprofile,:like,:notice]}
  before_action :notice_checked,{only:[:notice]}
  before_action :set_userprofile,{only:[:like,:follow,:follower,:media]}
  before_action :sign_in_required

  def notice_checked
    @notices=Notice.where.not(user_id:@current_user.id).where(visited_id:@current_user.id,checked: false).order(created_at: :desc)
    @notices.each do |notice|
      if notice.checked==false
        notice.checked=true
        notice.save
      end
    end
  end

  def recomended_user
    @serch_users=User.where.not(id: @current_user.id).shuffle
  end

  def set_userprofile
    @post=Post.new
    @users=User.find_by(public_uid: params[:id])
    @genre=Genre.find_by(user_id: @users.id)
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
  end

  def userprofile
    @post=Post.new
    @users=User.find_by(public_uid: params[:id])
    @genre=Genre.find_by(user_id: @users.id)
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
    @posts=Post.where(User_id: @users.id).order(created_at: :desc)
    @recomended_users=User.where("content LIKE?","%a%").limit(5)
    @recomended_users=@recomended_users.shuffle
  end

  def edit
    @users=User.find_by(public_uid:params[:id])
    @users.update(user_params)

    if @users.save then
      flash[:notice]="プロフィールを変更しました!"
      redirect_to "/profile/#{@users.public_uid}"
    else
      flash[:notice]="error:エラーが発生したため、もう一度設定し直してください！"
      redirect_back(fallback_location: "/posts/index")
    end
  end

  def like
    @like=Like.where(user_id: @users.id).order(created_at: :desc)
    @recomended_users=User.where("content LIKE?","%エンジニア%").limit(5)
    @recomended_users=@recomended_users.shuffle
  end

  def serching
    @serch_word=params[:serch]
    redirect_to("/users/serch/#{@serch_word}")
  end

  def serch
    @serch_word=params[:serch]
    @serch_users=User.where("name LIKE?","%#{@serch_word}%").order(created_at: :desc)
    @serch_posts=Post.where("content LIKE?","%#{@serch_word}%").order(created_at: :desc)
  end

  def notice
    @posts=Post.all.order(created_at: :desc)
    @recomended_users=User.where("content LIKE?","%エンジニア%").limit(5)
    @recomended_users=@recomended_users.shuffle
    @follow=Follow.where(user_id: @current_user.id)
    @follower=Follow.where(follow_id: @current_user.id)
  end

  def follow
    @follows=Follow.where(user_id: @users.id)
    @follow_users=[]
    @i=0
    @follows.each do |follow|
      @follow_users[@i]=User.find_by(id:follow.follow_id)
      @i=@i+1
    end
  end

  def follower
    @followers=Follow.where(follow_id: @users.id)
    @follower_users=[]
    @i=0
    @followers.each do |follower|
      @follower_users[@i]=User.find_by(id:follower.user_id)
      @i=@i+1
    end
  end

  def genre
  end

  def media
    @posts=Post.where(user_id: @users.id)
  end

  private
  def user_params
    params.require(:user).permit(:name,:image,:public_uid,:content,:background)
  end
end
