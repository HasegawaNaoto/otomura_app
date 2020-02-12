class SerchController < ApplicationController
  before_action :sign_in_required
  def serch
    @serch=Serch.new
    @post=Post.new
  end

  def posts
    @post=Post.new
    @serch=Serch.find_by(user_id: @current_user.id)
    unless @serch.word==nil || @serch.word==""
      @serch_posts=Post.where("content LIKE?","%#{@serch.word}%")
    end

    i=0
    @serch_posts_words=[]
    if @serch_posts
      @serch_posts.each do |serch_post|
        if serch_post.comment_id==nil
          @serch_posts_words[i]=Post.find_by(id: serch_post.id)
        end
        i=i+1
      end
    end
  end

  def users
    @post=Post.new
    @serch=Serch.find_by(user_id: @current_user.id)
    unless @serch.gender==nil || @serch.gender==""
      @serch_results_gender=Gender.where.not(user_id: @current_user.id).where(gender: @serch.gender)
      @serch_results_gender=Gender.where(gender: @serch.gender)
      @i=0
      @serch_users_gender=[]
      @serch_results_gender.length.times do
        @serch_users_gender[@i]=User.find_by(id:@serch_results_gender[@i].user_id)
        @i=@i+1
      end
    end

    if @serch.gender==nil || @serch.gender==""
      @serch_results_gender=Gender.where.not(user_id: @current_user.id)
      @i=0
      @serch_users_gender=[]
      @serch_results_gender.length.times do
        @serch_users_gender[@i]=User.find_by(id:@serch_results_gender[@i].user_id)
        @i=@i+1
      end
    end


    unless @serch.area==nil || @serch.area==""
      @serch_results_prefecture=Prefecture.where.not(user_id: @current_user.id).where(area: @serch.area)
      @i=0
      @serch_users_prefecture=[]
      @serch_results_prefecture.length.times do
        @serch_users_prefecture[@i]=User.find_by(id:@serch_results_prefecture[@i].user_id)
        @i=@i+1
      end
    end

    if @serch.area==nil || @serch.area==""
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


    if @serch.vocal==true
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

    if @serch.guiter==true
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

    if @serch.bass==true
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

    if @serch.drum==true
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

    if @serch.key==true
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

    if @serch.dj==true
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

    if @serch.sax==true
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

    if @serch.violin==true
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

    unless @serch.other_instrument==nil || @serch.other_instrument==""
      @serch_results_instrument_other=Instrument.where.not(user_id: @current_user.id).where("other LIKE?","%#{@serch.other_instrument}%")
      @i=0
      @serch_users_instrument_other=[]
      @serch_results_instrument_other.length.times do
        @serch_users_instrument_other[@i]=User.find_by(id: @serch_results_instrument_other[@i].user_id)
        @i=@i+1
      end
    end

    if @serch.other_instrument==nil || @serch.other_instrument==""
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

    if @serch.rock==true
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

    if @serch.punk==true
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

    if @serch.pop==true
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

    if @serch.ambient==true
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

    if @serch.alternative==true
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


    if @serch.classic==true
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

    if @serch.jazz==true
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


    if @serch.hard_rock==true
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

    if @serch.progressive==true
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

    if @serch.pop_punk==true
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

    if @serch.heavy_metal==true
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

    if @serch.metalcore==true
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

    if @serch.emo==true
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

    if @serch.merocore==true
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

    if @serch.hiphop==true
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

    if @serch.instrument==true
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

    if @serch.western==true
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

    if @serch.japanese==true
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

    if @serch.acoustic==true
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

    unless @serch.other_genre==nil || @serch.other_genre==""
      @serch_results_genre_other=Genre.where.not(user_id: @current_user.id).or(Genre.where("other1 LIKE?","%#{@serch.other_genre}%")).or(Genre.where("other2 LIKE?","%#{@serch.other_genre}%")).or(Genre.where("other3 LIKE?","%#{@serch.other_genre}%")).or(Genre.where("other4 LIKE?","%#{@serch.other_genre}%")).or(Genre.where("other5 LIKE?","%#{@serch.other_genre}%"))
      @i=0
      @serch_users_genre_other=[]
      @serch_results_genre_other.length.times do
        @serch_users_genre_other[@i]=User.find_by(id: @serch_results_genre_other[@i].user_id)
        @i=@i+1
      end
    end

    if @serch.other_genre==nil || @serch.other_genre==""
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

    unless @serch.word==nil || @serch.word==""
      @serch_users_word=User.where.not(id: @current_user.id).where("name LIKE?","%#{@serch.word}%").or(User.where("content LIKE?","%#{@serch.word}%"))
    end

    if @serch.word==nil || @serch.word==""
      @serch_users_word=User.where.not(id: @current_user.id)
    end

    @k=0
    @i=0
    @serch_users_load_30=[]
    @serch_users_load_29.length.times do
      @j=0
      @serch_users_word.length.times do
        if @serch_users_load_29[@i].id==@serch_users_word[@j].id
          @serch_users_load_30[@k]=User.find_by(id: @serch_users_load_29[@i].id)
          @k=@k+1
        end
        @j=@j+1
      end
      @i=@i+1
    end
  end

  def create
    @serch=Serch.find_by(user_id: @current_user.id)

    unless @serch
      @serch = Serch.new(serch_params)
      @serch.user_id=@current_user.id
      @serch.save
      if (@serch.word=="" || @serch.word==nil) && (@serch.gender=="" || @serch.gender==nil) && (@serch.area=="" ||  @serch.area==nil) && @serch.vocal==false && @serch.guiter==false && @serch.bass==false && @serch.drum==false && @serch.key==false && @serch.dj==false && @serch.sax==false && @serch.violin==false && (@serch.other_instrument=="" || @serch.other_instrument==nil) && @serch.rock==false && @serch.punk==false && @serch.pop==false && @serch.ambient==false && @serch.alternative==false && @serch.classic==false && @serch.jazz==false &&  @serch.hard_rock==false && @serch.progressive==false && @serch.pop_punk==false && @serch.heavy_metal==false && @serch.metalcore==false && @serch.emo==false && @serch.merocore==false && @serch.hiphop==false && @serch.instrument==false && @serch.western==false && @serch.japanese==false && @serch.acoustic==false && (@serch.other_genre=="" || @serch.other_genre==nil)

        redirect_back fallback_location: "/posts/index",notice: '検索ワードを選択または入力してください！'
      else
        redirect_to "/search/#{@current_user.public_uid}/users"
      end

    else
      @serch.destroy
      @serch = Serch.new(serch_params)
      @serch.user_id=@current_user.id
      @serch.save
      if (@serch.word=="" || @serch.word==nil) && (@serch.gender=="" || @serch.gender==nil) && (@serch.area=="" ||  @serch.area==nil) && @serch.vocal==false && @serch.guiter==false && @serch.bass==false && @serch.drum==false && @serch.key==false && @serch.dj==false && @serch.sax==false && @serch.violin==false && (@serch.other_instrument=="" || @serch.other_instrument==nil) && @serch.rock==false && @serch.punk==false && @serch.pop==false && @serch.ambient==false && @serch.alternative==false && @serch.classic==false && @serch.jazz==false &&  @serch.hard_rock==false && @serch.progressive==false && @serch.pop_punk==false && @serch.heavy_metal==false && @serch.metalcore==false && @serch.emo==false && @serch.merocore==false && @serch.hiphop==false && @serch.instrument==false && @serch.western==false && @serch.japanese==false && @serch.acoustic==false && (@serch.other_genre=="" || @serch.other_genre==nil)
        redirect_back fallback_location: "/posts/index",notice: '検索ワードを選択または入力してください！'
      else
        redirect_to "/search/#{@current_user.public_uid}/users"
      end
    end
  end

  private
  def serch_params
    params.require(:serch).permit(:gender,:area,:vocal,:guiter,:bass,:drum,:key,:dj,:sax,:violin,:rock,:punk,:pop,:ambient,:alternative,:classic,:jazz,:hard_rock,:progressive,:pop_punk,:heavy_metal,:metalcore,:emo,:merocore,:hiphop,:instrument,:western,:japanese,:acoustic,:word,:other_instrument,:other_genre)
  end
end
