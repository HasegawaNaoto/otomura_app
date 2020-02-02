class UsersController < ApplicationController
  before_action :recomended_user,{only:[:userprofile,:like,:notice]}
  before_action :notice_checked,{only:[:notice]}

  def userprofile
    @post=Post.new
    @users=User.find_by(public_uid: params[:id])
    @serch=Serch.new
    @like=Like.where(user_id: @users.id).order(created_at: :desc)
    @posts=Post.where(User_id: @users.id).order(created_at: :desc)
    @recomended_users=User.where("content LIKE?","%a%").limit(5)
    @recomended_users=@recomended_users.shuffle
    @genre=Genre.find_by(user_id: @users.id)
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
  end

  def editprofile
    @users=User.find_by(public_uid: params[:id])
  end

  def edit
    @users=User.find_by(public_uid:params[:id])
    @users.update(user_params)

    if @users.save then
      flash[:notice]="プロフィールを変更しました!"
      redirect_to("/profile/#{@users.public_uid}")
    else
      flash[:notice]="プロフィールの変更に失敗しました!"
      redirect_back(fallback_location: "/posts/index")
    end
  end

  def like
    @post=Post.new
    @users=User.find_by(public_uid:params[:id])
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @like=Like.where(user_id: @users.id).order(created_at: :desc)
    @recomended_users=User.where("content LIKE?","%エンジニア%").limit(5)
    @recomended_users=@recomended_users.shuffle
    @genre=Genre.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
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

  def notice_checked
    @notices=Notice.where.not(send_id:@current_user.id).where(visited_id:@current_user.id,checked: false).order(created_at: :desc)
    @notices.each do |notice|
      if notice.checked==false
        notice.checked=true
        notice.save
      end
    end
  end

  def notice
    @post=Post.new
    @users=User.find_by(public_uid: params[:id])
    @posts=Post.all.order(created_at: :desc)
    @recomended_users=User.where("content LIKE?","%エンジニア%").limit(5)
    @recomended_users=@recomended_users.shuffle

    @follow=Follow.all
    @follow_count=0
    @follower_count=0
    @follow.each do |follow|
      if follow.follow_id!=nil && follow.user_id==@current_user.id
        @follow_count=@follow_count+1
      elsif follow.follower_id!=nil && follow.user_id==@current_user.id
        @follower_count=@follower_count+1
      end
    end
  end

  def follow
    @post=Post.new
    @users=User.find_by(public_uid: params[:id])
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @follows=Follow.where(user_id: @users.id).where.not(follow_id: @users.id)
    @follow_users=[]
    @i=0
    @follows.each do |follow|
      @follow_users[@i]=User.find_by(id:follow.follow_id)
      @i=@i+1
    end
    @genre=Genre.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
  end

  def follower
    @post=Post.new
    @users=User.find_by(public_uid: params[:id])
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @followers=Follow.where(user_id: @users.id).where.not(follower_id: @users.id)
    @follower_users=[]
    @i=0
    @followers.each do |follower|
      @follower_users[@i]=User.find_by(id:follower.follower_id)
      @i=@i+1
    end
    @genre=Genre.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
  end

  def genre
    @genre=Genre.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
  end

  def recomended_user
    @serch_users_load_33_or=User.where.not(id: @current_user.id).shuffle
    @current_user_gender=Gender.find_by(user_id: @current_user.id)
    @current_user_instrument=Instrument.find_by(user_id: @current_user.id)
    @current_user_prefecture=Prefecture.find_by(user_id: @current_user.id)
    @current_user_genre=Genre.find_by(user_id: @current_user.id)

    unless @current_user_gender.gender==nil || @current_user_gender.gender==""
      @serch_results_gender=Gender.where.not(user_id: @current_user.id).where(gender: @current_user_gender.gender)
      @i=0
      @serch_users_gender=[]
      @serch_results_gender.length.times do
        @serch_users_gender[@i]=User.find_by(id:@serch_results_gender[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_gender.gender==nil || @current_user_gender.gender==""
      @serch_results_gender=Gender.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_gender=[]
      @serch_results_gender.length.times do
        @serch_users_gender[@i]=User.find_by(id:@serch_results_gender[@i].user_id)
        @i=@i+1
      end
    end

    unless @current_user_prefecture.area==nil || @current_user_prefecture.area==""
      @serch_results_prefecture=Prefecture.where.not(user_id: @current_user.id).where(area: @current_user_prefecture.area)
      @i=0
      @serch_users_prefecture=[]
      @serch_results_prefecture.length.times do
        @serch_users_prefecture[@i]=User.find_by(id:@serch_results_prefecture[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_prefecture.area==nil || @current_user_prefecture.area==""
      @serch_results_prefecture=Prefecture.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_prefecture=[]
      @serch_results_prefecture.length.times do
        @serch_users_prefecture[@i]=User.find_by(id:@serch_results_prefecture[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_0=[]
    @serch_users_gender.length.times do
      @j=0
      @serch_users_prefecture.length.times do
        if @serch_users_gender[@i].id==@serch_users_prefecture[@j].id
          @serch_users_load_0[@k]=User.find_by(id: @serch_users_gender[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end


    if @current_user_instrument.vocal==true
      @serch_results_instrument_vocal=Instrument.where.not(user_id: @current_user.id,vocal:false)
      @i=0
      @serch_users_instrument_vocal=[]
      @serch_results_instrument_vocal.length.times do
        @serch_users_instrument_vocal[@i]=User.find_by(id: @serch_results_instrument_vocal[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_vocal=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_vocal=[]
      @serch_results_instrument_vocal.length.times do
        @serch_users_instrument_vocal[@i]=User.find_by(id: @serch_results_instrument_vocal[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_1=[]
    @serch_users_load_0.length.times do
      @j=0
      @serch_users_instrument_vocal.length.times do
        if @serch_users_load_0[@i].id==@serch_users_instrument_vocal[@j].id
          @serch_users_load_1[@k]=User.find_by(id: @serch_users_load_0[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_instrument.guiter==true
      @serch_results_instrument_guiter=Instrument.where.not(user_id: @current_user.id,guiter:false)
      @i=0
      @serch_users_instrument_guiter=[]
      @serch_results_instrument_guiter.length.times do
        @serch_users_instrument_guiter[@i]=User.find_by(id: @serch_results_instrument_guiter[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_guiter=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_guiter=[]
      @serch_results_instrument_guiter.length.times do
        @serch_users_instrument_guiter[@i]=User.find_by(id: @serch_results_instrument_guiter[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_2=[]
    @serch_users_load_1.length.times do
      @j=0
      @serch_users_instrument_guiter.length.times do
        if @serch_users_load_1[@i].id==@serch_users_instrument_guiter[@j].id
          @serch_users_load_2[@k]=User.find_by(id: @serch_users_load_1[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_instrument.bass==true
      @serch_results_instrument_bass=Instrument.where.not(user_id: @current_user.id,bass:false)
      @i=0
      @serch_users_instrument_bass=[]
      @serch_results_instrument_bass.length.times do
        @serch_users_instrument_bass[@i]=User.find_by(id: @serch_results_instrument_bass[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_bass=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_bass=[]
      @serch_results_instrument_bass.length.times do
        @serch_users_instrument_bass[@i]=User.find_by(id: @serch_results_instrument_bass[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_3=[]
    @serch_users_load_2.length.times do
      @j=0
      @serch_users_instrument_bass.length.times do
        if @serch_users_load_2[@i].id==@serch_users_instrument_bass[@j].id
          @serch_users_load_3[@k]=User.find_by(id: @serch_users_load_2[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_instrument.drum==true
      @serch_results_instrument_drum=Instrument.where.not(user_id: @current_user.id,drum:false)
      @i=0
      @serch_users_instrument_drum=[]
      @serch_results_instrument_drum.length.times do
        @serch_users_instrument_drum[@i]=User.find_by(id: @serch_results_instrument_drum[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_drum=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_drum=[]
      @serch_results_instrument_drum.length.times do
        @serch_users_instrument_drum[@i]=User.find_by(id: @serch_results_instrument_drum[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_4=[]
    @serch_users_load_3.length.times do
      @j=0
      @serch_users_instrument_drum.length.times do
        if @serch_users_load_3[@i].id==@serch_users_instrument_drum[@j].id
          @serch_users_load_4[@k]=User.find_by(id: @serch_users_load_3[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_instrument.key==true
      @serch_results_instrument_key=Instrument.where.not(user_id: @current_user.id,key:false)
      @i=0
      @serch_users_instrument_key=[]
      @serch_results_instrument_key.length.times do
        @serch_users_instrument_key[@i]=User.find_by(id: @serch_results_instrument_key[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_key=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_key=[]
      @serch_results_instrument_key.length.times do
        @serch_users_instrument_key[@i]=User.find_by(id: @serch_results_instrument_key[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_5=[]
    @serch_users_load_4.length.times do
      @j=0
      @serch_users_instrument_key.length.times do
        if @serch_users_load_4[@i].id==@serch_users_instrument_key[@j].id
          @serch_users_load_5[@k]=User.find_by(id: @serch_users_load_4[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_instrument.dj==true
      @serch_results_instrument_dj=Instrument.where.not(user_id: @current_user.id,dj:false)
      @i=0
      @serch_users_instrument_dj=[]
      @serch_results_instrument_dj.length.times do
        @serch_users_instrument_dj[@i]=User.find_by(id: @serch_results_instrument_dj[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_dj=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_dj=[]
      @serch_results_instrument_dj.length.times do
        @serch_users_instrument_dj[@i]=User.find_by(id: @serch_results_instrument_dj[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_6=[]
    @serch_users_load_5.length.times do
      @j=0
      @serch_users_instrument_dj.length.times do
        if @serch_users_load_5[@i].id==@serch_users_instrument_dj[@j].id
          @serch_users_load_6[@k]=User.find_by(id: @serch_users_load_5[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_instrument.sax==true
      @serch_results_instrument_sax=Instrument.where.not(user_id: @current_user.id,sax:false)
      @i=0
      @serch_users_instrument_sax=[]
      @serch_results_instrument_sax.length.times do
        @serch_users_instrument_sax[@i]=User.find_by(id: @serch_results_instrument_sax[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_sax=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_sax=[]
      @serch_results_instrument_sax.length.times do
        @serch_users_instrument_sax[@i]=User.find_by(id: @serch_results_instrument_sax[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_7=[]
    @serch_users_load_6.length.times do
      @j=0
      @serch_users_instrument_sax.length.times do
        if @serch_users_load_6[@i].id==@serch_users_instrument_sax[@j].id
          @serch_users_load_7[@k]=User.find_by(id: @serch_users_load_6[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_instrument.violin==true
      @serch_results_instrument_violin=Instrument.where.not(user_id: @current_user.id,violin:false)
      @i=0
      @serch_users_instrument_violin=[]
      @serch_results_instrument_violin.length.times do
        @serch_users_instrument_violin[@i]=User.find_by(id: @serch_results_instrument_violin[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_instrument_violin=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_violin=[]
      @serch_results_instrument_violin.length.times do
        @serch_users_instrument_violin[@i]=User.find_by(id: @serch_results_instrument_violin[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_8=[]
    @serch_users_load_7.length.times do
      @j=0
      @serch_users_instrument_violin.length.times do
        if @serch_users_load_7[@i].id==@serch_users_instrument_violin[@j].id
          @serch_users_load_8[@k]=User.find_by(id: @serch_users_load_7[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    unless @current_user_instrument.other==nil || @current_user_instrument.other==""
      @serch_results_instrument_other=Instrument.where.not(user_id: @current_user.id).where("other LIKE?","%#{@current_user_instrument.other}%")
      @i=0
      @serch_users_instrument_other=[]
      @serch_results_instrument_other.length.times do
        @serch_users_instrument_other[@i]=User.find_by(id: @serch_results_instrument_other[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_instrument.other==nil || @current_user_instrument.other==""
      @serch_results_instrument_other=Instrument.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_instrument_other=[]
      @serch_results_instrument_other.length.times do
        @serch_users_instrument_other[@i]=User.find_by(id: @serch_results_instrument_other[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_9=[]
    @serch_users_load_8.length.times do
      @j=0
      @serch_users_instrument_other.length.times do
        if @serch_users_load_8[@i].id==@serch_users_instrument_other[@j].id
          @serch_users_load_9[@k]=User.find_by(id: @serch_users_load_8[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.rock==true
      @serch_results_genre_rock=Genre.where.not(user_id: @current_user.id,rock:false)
      @i=0
      @serch_users_genre_rock=[]
      @serch_results_genre_rock.length.times do
        @serch_users_genre_rock[@i]=User.find_by(id: @serch_results_genre_rock[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_rock=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_rock=[]
      @serch_results_genre_rock.length.times do
        @serch_users_genre_rock[@i]=User.find_by(id: @serch_results_genre_rock[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_10=[]
    @serch_users_load_9.length.times do
      @j=0
      @serch_users_genre_rock.length.times do
        if @serch_users_load_9[@i].id==@serch_users_genre_rock[@j].id
          @serch_users_load_10[@k]=User.find_by(id: @serch_users_load_9[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.punk==true
      @serch_results_genre_punk=Genre.where.not(user_id: @current_user.id,punk:false)
      @i=0
      @serch_users_genre_punk=[]
      @serch_results_genre_punk.length.times do
        @serch_users_genre_punk[@i]=User.find_by(id: @serch_results_genre_punk[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_punk=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_punk=[]
      @serch_results_genre_punk.length.times do
        @serch_users_genre_punk[@i]=User.find_by(id: @serch_results_genre_punk[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_11=[]
    @serch_users_load_10.length.times do
      @j=0
      @serch_users_genre_punk.length.times do
        if @serch_users_load_10[@i].id==@serch_users_genre_punk[@j].id
          @serch_users_load_11[@k]=User.find_by(id: @serch_users_load_10[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.pop==true
      @serch_results_genre_pop=Genre.where.not(user_id: @current_user.id,pop:false)
      @i=0
      @serch_users_genre_pop=[]
      @serch_results_genre_pop.length.times do
        @serch_users_genre_pop[@i]=User.find_by(id: @serch_results_genre_pop[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_pop=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_pop=[]
      @serch_results_genre_pop.length.times do
        @serch_users_genre_pop[@i]=User.find_by(id: @serch_results_genre_pop[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_12=[]
    @serch_users_load_11.length.times do
      @j=0
      @serch_users_genre_pop.length.times do
        if @serch_users_load_11[@i].id==@serch_users_genre_pop[@j].id
          @serch_users_load_12[@k]=User.find_by(id: @serch_users_load_11[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.ambient==true
      @serch_results_genre_ambient=Genre.where.not(user_id: @current_user.id,ambient:false)
      @i=0
      @serch_users_genre_ambient=[]
      @serch_results_genre_ambient.length.times do
        @serch_users_genre_ambient[@i]=User.find_by(id: @serch_results_genre_ambient[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_ambient=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_ambient=[]
      @serch_results_genre_ambient.length.times do
        @serch_users_genre_ambient[@i]=User.find_by(id: @serch_results_genre_ambient[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_13=[]
    @serch_users_load_12.length.times do
      @j=0
      @serch_users_genre_ambient.length.times do
        if @serch_users_load_12[@i].id==@serch_users_genre_ambient[@j].id
          @serch_users_load_13[@k]=User.find_by(id: @serch_users_load_12[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.alternative==true
      @serch_results_genre_alternative=Genre.where.not(user_id: @current_user.id,alternative:false)
      @i=0
      @serch_users_genre_alternative=[]
      @serch_results_genre_alternative.length.times do
        @serch_users_genre_alternative[@i]=User.find_by(id: @serch_results_genre_alternative[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_alternative=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_alternative=[]
      @serch_results_genre_alternative.length.times do
        @serch_users_genre_alternative[@i]=User.find_by(id: @serch_results_genre_alternative[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_14=[]
    @serch_users_load_13.length.times do
      @j=0
      @serch_users_genre_alternative.length.times do
        if @serch_users_load_13[@i].id==@serch_users_genre_alternative[@j].id
          @serch_users_load_14[@k]=User.find_by(id: @serch_users_load_13[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end


    if @current_user_genre.classic==true
      @serch_results_genre_classic=Genre.where.not(user_id: @current_user.id,classic:false)
      @i=0
      @serch_users_genre_classic=[]
      @serch_results_genre_classic.length.times do
        @serch_users_genre_classic[@i]=User.find_by(id: @serch_results_genre_classic[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_classic=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_classic=[]
      @serch_results_genre_classic.length.times do
        @serch_users_genre_classic[@i]=User.find_by(id: @serch_results_genre_classic[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_15=[]
    @serch_users_load_14.length.times do
      @j=0
      @serch_users_genre_classic.length.times do
        if @serch_users_load_14[@i].id==@serch_users_genre_classic[@j].id
          @serch_users_load_15[@k]=User.find_by(id: @serch_users_load_14[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.jazz==true
      @serch_results_genre_jazz=Genre.where.not(user_id: @current_user.id,jazz:false)
      @i=0
      @serch_users_genre_jazz=[]
      @serch_results_genre_jazz.length.times do
        @serch_users_genre_jazz[@i]=User.find_by(id: @serch_results_genre_jazz[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_jazz=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_jazz=[]
      @serch_results_genre_jazz.length.times do
        @serch_users_genre_jazz[@i]=User.find_by(id: @serch_results_genre_jazz[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_16=[]
    @serch_users_load_15.length.times do
      @j=0
      @serch_users_genre_jazz.length.times do
        if @serch_users_load_15[@i].id==@serch_users_genre_jazz[@j].id
          @serch_users_load_16[@k]=User.find_by(id: @serch_users_load_15[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end


    if @current_user_genre.hard_rock==true
      @serch_results_genre_hard_rock=Genre.where.not(user_id: @current_user.id,hard_rock:false)
      @i=0
      @serch_users_genre_hard_rock=[]
      @serch_results_genre_hard_rock.length.times do
        @serch_users_genre_hard_rock[@i]=User.find_by(id: @serch_results_genre_hard_rock[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_hard_rock=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_hard_rock=[]
      @serch_results_genre_hard_rock.length.times do
        @serch_users_genre_hard_rock[@i]=User.find_by(id: @serch_results_genre_hard_rock[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_17=[]
    @serch_users_load_16.length.times do
      @j=0
      @serch_users_genre_hard_rock.length.times do
        if @serch_users_load_16[@i].id==@serch_users_genre_hard_rock[@j].id
          @serch_users_load_17[@k]=User.find_by(id: @serch_users_load_16[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.progressive==true
      @serch_results_genre_progressive=Genre.where.not(user_id: @current_user.id,progressive:false)
      @i=0
      @serch_users_genre_progressive=[]
      @serch_results_genre_progressive.length.times do
        @serch_users_genre_progressive[@i]=User.find_by(id: @serch_results_genre_progressive[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_progressive=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_progressive=[]
      @serch_results_genre_progressive.length.times do
        @serch_users_genre_progressive[@i]=User.find_by(id: @serch_results_genre_progressive[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_18=[]
    @serch_users_load_17.length.times do
      @j=0
      @serch_users_genre_progressive.length.times do
        if @serch_users_load_17[@i].id==@serch_users_genre_progressive[@j].id
          @serch_users_load_18[@k]=User.find_by(id: @serch_users_load_17[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.pop_punk==true
      @serch_results_genre_pop_punk=Genre.where.not(user_id: @current_user.id,pop_punk:false)
      @i=0
      @serch_users_genre_pop_punk=[]
      @serch_results_genre_pop_punk.length.times do
        @serch_users_genre_pop_punk[@i]=User.find_by(id: @serch_results_genre_pop_punk[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_pop_punk=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_pop_punk=[]
      @serch_results_genre_pop_punk.length.times do
        @serch_users_genre_pop_punk[@i]=User.find_by(id: @serch_results_genre_pop_punk[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_19=[]
    @serch_users_load_18.length.times do
      @j=0
      @serch_users_genre_pop_punk.length.times do
        if @serch_users_load_18[@i].id==@serch_users_genre_pop_punk[@j].id
          @serch_users_load_19[@k]=User.find_by(id: @serch_users_load_18[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.heavy_metal==true
      @serch_results_genre_heavy_metal=Genre.where.not(user_id: @current_user.id,heavy_metal:false)
      @i=0
      @serch_users_genre_heavy_metal=[]
      @serch_results_genre_heavy_metal.length.times do
        @serch_users_genre_heavy_metal[@i]=User.find_by(id: @serch_results_genre_heavy_metal[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_heavy_metal=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_heavy_metal=[]
      @serch_results_genre_heavy_metal.length.times do
        @serch_users_genre_heavy_metal[@i]=User.find_by(id: @serch_results_genre_heavy_metal[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_20=[]
    @serch_users_load_19.length.times do
      @j=0
      @serch_users_genre_heavy_metal.length.times do
        if @serch_users_load_19[@i].id==@serch_users_genre_heavy_metal[@j].id
          @serch_users_load_20[@k]=User.find_by(id: @serch_users_load_19[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.metalcore==true
      @serch_results_genre_metalcore=Genre.where.not(user_id: @current_user.id,metalcore:false)
      @i=0
      @serch_users_genre_metalcore=[]
      @serch_results_genre_metalcore.length.times do
        @serch_users_genre_metalcore[@i]=User.find_by(id: @serch_results_genre_metalcore[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_metalcore=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_metalcore=[]
      @serch_results_genre_metalcore.length.times do
        @serch_users_genre_metalcore[@i]=User.find_by(id: @serch_results_genre_metalcore[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_21=[]
    @serch_users_load_20.length.times do
      @j=0
      @serch_users_genre_metalcore.length.times do
        if @serch_users_load_20[@i].id==@serch_users_genre_metalcore[@j].id
          @serch_users_load_21[@k]=User.find_by(id: @serch_users_load_20[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.emo==true
      @serch_results_genre_emo=Genre.where.not(user_id: @current_user.id,emo:false)
      @i=0
      @serch_users_genre_emo=[]
      @serch_results_genre_emo.length.times do
        @serch_users_genre_emo[@i]=User.find_by(id: @serch_results_genre_emo[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_emo=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_emo=[]
      @serch_results_genre_emo.length.times do
        @serch_users_genre_emo[@i]=User.find_by(id: @serch_results_genre_emo[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_22=[]
    @serch_users_load_21.length.times do
      @j=0
      @serch_users_genre_emo.length.times do
        if @serch_users_load_21[@i].id==@serch_users_genre_emo[@j].id
          @serch_users_load_22[@k]=User.find_by(id: @serch_users_load_21[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.merocore==true
      @serch_results_genre_merocore=Genre.where.not(user_id: @current_user.id,merocore:false)
      @i=0
      @serch_users_genre_merocore=[]
      @serch_results_genre_merocore.length.times do
        @serch_users_genre_merocore[@i]=User.find_by(id: @serch_results_genre_merocore[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_merocore=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_merocore=[]
      @serch_results_genre_merocore.length.times do
        @serch_users_genre_merocore[@i]=User.find_by(id: @serch_results_genre_merocore[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_23=[]
    @serch_users_load_22.length.times do
      @j=0
      @serch_users_genre_merocore.length.times do
        if @serch_users_load_22[@i].id==@serch_users_genre_merocore[@j].id
          @serch_users_load_23[@k]=User.find_by(id: @serch_users_load_22[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.hiphop==true
      @serch_results_genre_hiphop=Genre.where.not(user_id: @current_user.id,hiphop:false)
      @i=0
      @serch_users_genre_hiphop=[]
      @serch_results_genre_hiphop.length.times do
        @serch_users_genre_hiphop[@i]=User.find_by(id: @serch_results_genre_hiphop[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_hiphop=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_hiphop=[]
      @serch_results_genre_hiphop.length.times do
        @serch_users_genre_hiphop[@i]=User.find_by(id: @serch_results_genre_hiphop[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_24=[]
    @serch_users_load_23.length.times do
      @j=0
      @serch_users_genre_hiphop.length.times do
        if @serch_users_load_23[@i].id==@serch_users_genre_hiphop[@j].id
          @serch_users_load_24[@k]=User.find_by(id: @serch_users_load_23[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.instrument==true
      @serch_results_genre_instrument=Genre.where.not(user_id: @current_user.id,instrument:false)
      @i=0
      @serch_users_genre_instrument=[]
      @serch_results_genre_instrument.length.times do
        @serch_users_genre_instrument[@i]=User.find_by(id: @serch_results_genre_instrument[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_instrument=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_instrument=[]
      @serch_results_genre_instrument.length.times do
        @serch_users_genre_instrument[@i]=User.find_by(id: @serch_results_genre_instrument[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_25=[]
    @serch_users_load_24.length.times do
      @j=0
      @serch_users_genre_instrument.length.times do
        if @serch_users_load_24[@i].id==@serch_users_genre_instrument[@j].id
          @serch_users_load_25[@k]=User.find_by(id: @serch_users_load_24[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.western==true
      @serch_results_genre_western=Genre.where.not(user_id: @current_user.id,western:false)
      @i=0
      @serch_users_genre_western=[]
      @serch_results_genre_western.length.times do
        @serch_users_genre_western[@i]=User.find_by(id: @serch_results_genre_western[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_western=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_western=[]
      @serch_results_genre_western.length.times do
        @serch_users_genre_western[@i]=User.find_by(id: @serch_results_genre_western[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_26=[]
    @serch_users_load_25.length.times do
      @j=0
      @serch_users_genre_western.length.times do
        if @serch_users_load_25[@i].id==@serch_users_genre_western[@j].id
          @serch_users_load_26[@k]=User.find_by(id: @serch_users_load_25[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.japanese==true
      @serch_results_genre_japanese=Genre.where.not(user_id: @current_user.id,japanese:false)
      @i=0
      @serch_users_genre_japanese=[]
      @serch_results_genre_japanese.length.times do
        @serch_users_genre_japanese[@i]=User.find_by(id: @serch_results_genre_japanese[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_japanese=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_japanese=[]
      @serch_results_genre_japanese.length.times do
        @serch_users_genre_japanese[@i]=User.find_by(id: @serch_results_genre_japanese[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_27=[]
    @serch_users_load_26.length.times do
      @j=0
      @serch_users_genre_japanese.length.times do
        if @serch_users_load_26[@i].id==@serch_users_genre_japanese[@j].id
          @serch_users_load_27[@k]=User.find_by(id: @serch_users_load_26[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    if @current_user_genre.acoustic==true
      @serch_results_genre_acoustic=Genre.where.not(user_id: @current_user.id,acoustic:false)
      @i=0
      @serch_users_genre_acoustic=[]
      @serch_results_genre_acoustic.length.times do
        @serch_users_genre_acoustic[@i]=User.find_by(id: @serch_results_genre_acoustic[@i].user_id)
        @i=@i+1
      end

    else
      @serch_results_genre_acoustic=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_acoustic=[]
      @serch_results_genre_acoustic.length.times do
        @serch_users_genre_acoustic[@i]=User.find_by(id: @serch_results_genre_acoustic[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_28=[]
    @serch_users_load_27.length.times do
      @j=0
      @serch_users_genre_acoustic.length.times do
        if @serch_users_load_27[@i].id==@serch_users_genre_acoustic[@j].id
          @serch_users_load_28[@k]=User.find_by(id: @serch_users_load_27[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    unless @current_user_genre.other1==nil || @current_user_genre.other1==""
      @serch_results_genre_other=Genre.where.not(user_id: @current_user.id).or(Genre.where("other1 LIKE?","%#{@current_user_genre.other1}%"))
      @i=0
      @serch_users_genre_other=[]
      @serch_results_genre_other.length.times do
        @serch_users_genre_other[@i]=User.find_by(id: @serch_results_genre_other[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_genre.other1==nil || @current_user_genre.other1==""
      @serch_results_genre_other=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_other=[]
      @serch_results_genre_other.length.times do
        @serch_users_genre_other[@i]=User.find_by(id: @serch_results_genre_other[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_29=[]
    @serch_users_load_28.length.times do
      @j=0
      @serch_users_genre_other.length.times do
        if @serch_users_load_28[@i].id==@serch_users_genre_other[@j].id
          @serch_users_load_29[@k]=User.find_by(id: @serch_users_load_28[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    unless @current_user_genre.other2==nil || @current_user_genre.other2==""
      @serch_results_genre_other2=Genre.where.not(user_id: @current_user.id).or(Genre.where("other2 LIKE?","%#{@current_user_genre.other2}%"))
      @i=0
      @serch_users_genre_other2=[]
      @serch_results_genre_other2.length.times do
        @serch_users_genre_other2[@i]=User.find_by(id: @serch_results_genre_other2[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_genre.other2==nil || @current_user_genre.other2==""
      @serch_results_genre_other2=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_other2=[]
      @serch_results_genre_other2.length.times do
        @serch_users_genre_other2[@i]=User.find_by(id: @serch_results_genre_other2[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_30=[]
    @serch_users_load_29.length.times do
      @j=0
      @serch_users_genre_other2.length.times do
        if @serch_users_load_29[@i].id==@serch_users_genre_other2[@j].id
          @serch_users_load_30[@k]=User.find_by(id: @serch_users_load_29[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    unless @current_user_genre.other3==nil || @current_user_genre.other3==""
      @serch_results_genre_other3=Genre.where.not(user_id: @current_user.id).or(Genre.where("other3 LIKE?","%#{@current_user_genre.other3}%"))
      @i=0
      @serch_users_genre_other3=[]
      @serch_results_genre_other3.length.times do
        @serch_users_genre_other3[@i]=User.find_by(id: @serch_results_genre_other3[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_genre.other3==nil || @current_user_genre.other3==""
      @serch_results_genre_other3=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_other3=[]
      @serch_results_genre_other3.length.times do
        @serch_users_genre_other3[@i]=User.find_by(id: @serch_results_genre_other3[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_31=[]
    @serch_users_load_30.length.times do
      @j=0
      @serch_users_genre_other3.length.times do
        if @serch_users_load_30[@i].id==@serch_users_genre_other3[@j].id
          @serch_users_load_31[@k]=User.find_by(id: @serch_users_load_30[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    unless @current_user_genre.other4==nil || @current_user_genre.other4==""
      @serch_results_genre_other4=Genre.where.not(user_id: @current_user.id).or(Genre.where("other4 LIKE?","%#{@current_user_genre.other4}%"))
      @i=0
      @serch_users_genre_other4=[]
      @serch_results_genre_other4.length.times do
        @serch_users_genre_other4[@i]=User.find_by(id: @serch_results_genre_other4[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_genre.other4==nil || @current_user_genre.other4==""
      @serch_results_genre_other4=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_other4=[]
      @serch_results_genre_other4.length.times do
        @serch_users_genre_other4[@i]=User.find_by(id: @serch_results_genre_other4[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_32=[]
    @serch_users_load_31.length.times do
      @j=0
      @serch_users_genre_other4.length.times do
        if @serch_users_load_31[@i].id==@serch_users_genre_other4[@j].id
          @serch_users_load_32[@k]=User.find_by(id: @serch_users_load_31[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end

    unless @current_user_genre.other5==nil || @current_user_genre.other5==""
      @serch_results_genre_other5=Genre.where.not(user_id: @current_user.id).or(Genre.where("other5 LIKE?","%#{@current_user_genre.other5}%"))
      @i=0
      @serch_users_genre_other5=[]
      @serch_results_genre_other5.length.times do
        @serch_users_genre_other5[@i]=User.find_by(id: @serch_results_genre_other5[@i].user_id)
        @i=@i+1
      end
    end

    if @current_user_genre.other5==nil || @current_user_genre.other5==""
      @serch_results_genre_other5=Genre.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_genre_other5=[]
      @serch_results_genre_other5.length.times do
        @serch_users_genre_other5[@i]=User.find_by(id: @serch_results_genre_other5[@i].user_id)
        @i=@i+1
      end
    end

    @k=0
    @i=0
    @serch_users_load_33=[]
    @serch_users_load_32.length.times do
      @j=0
      @serch_users_genre_other5.length.times do
        if @serch_users_load_32[@i].id==@serch_users_genre_other5[@j].id
          @serch_users_load_33[@k]=User.find_by(id: @serch_users_load_32[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end
  end

  def userlist
    @users=User.find_by(public_uid: params[:id])
    @posts=Post.where(user_id: @users.id)
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @friends=User.all
    @friends=Friendlist.where(user_id: @users.id)
    @i=0
    @friend_users=[]
    @friends.each do |friend|
      @friend_users[@i]=User.find_by(id:friend.friend_id)
      @i=@i+1
    end
    @genre=Genre.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
  end

  private
  def user_params
    params.require(:user).permit(:name,:image,:public_uid,:content,:background)
  end
end
