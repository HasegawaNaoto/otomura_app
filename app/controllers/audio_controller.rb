class AudioController < ApplicationController
  def form
    @audio=Audio.new
  end

  def search
    redirect_to "/audio/index" if params[:keyword] == ""
    split_keywords = params[:keyword].split(/[[:blank:]]+/)
    @search_word=[]
    split_keywords.each do |keyword|
      next if keyword==""
      @search_word +=AudioTag.where('genre LIKE?',"%#{keyword}%")
    end

    @audioTagmaps=[]
    @audios=[]
    i=0
    @search_word.each do |audioTag|
      @audioTagmaps[i]=AudioTagmap.find_by(audio_tag_id:audioTag.id)
      @audios[i]=Audio.find_by(id:@audioTagmaps[i].audio_id)
      i=i+1
    end

    @audios.uniq!
  end

  def show
    @audio=Audio.find_by(id: params[:id])
    @user=User.find_by(id: @audio.user_id)
    @tag=AudioTag.find_by(id: @audio.audio_tags.ids)
  end

  def list
    @users=User.find_by(public_uid:params[:id])
    @audios=Audio.where(user_id: @users.id)
    @prefecture=Prefecture.find_by(user_id: @users.id)
    @posts=Post.all.order(created_at: :desc)
    @genre=Genre.find_by(user_id: @users.id)
    @gender=Gender.find_by(user_id: @users.id)
    @instrument=Instrument.find_by(user_id: @users.id)
  end

  def tag
    @tag=AudioTag.find_by(genre:params[:id])
    @audioTagmaps=AudioTagmap.where(audio_tag_id:@tag.id)
  end

  def index
    @audios=Audio.all.order(created_at: :desc).limit 10
  end

  def create
    @audio = @current_user.audios.new(audio_params)
    tag_list = params[:audio][:genre].split(",")
    respond_to do |format|
      if @audio.save
        @audio.save_audios(tag_list)
        format.html { redirect_to "/audio/form", notice: '記事を投稿しました' }
      else
        format.html { render "audio/form" }
      end
    end
  end

  def searching
    @keyword=params[:audio][:keyword]
    redirect_to("/audio/search/#{@keyword}")
  end

  private
  def audio_params
    params.require(:audio).permit(:title,:file,:image)
  end

  def search_params
    params.require(:audio).permit(:keyword)
  end
end
