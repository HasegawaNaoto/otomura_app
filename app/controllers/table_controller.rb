class TableController < ApplicationController
  def posts
    @posts=Post.all
  end

  def users
    @users=User.all
  end

  def like
    @likes=Like.all
  end
  
  def friendlist
    @friendlist=Friendlist.all
  end

  def comment
    @comments=Comment.all
  end

  def notices
    @notices=Notice.all
  end

  def follow
    @follows=Follow.all
  end

  def serch
    @serchs=Serch.all
  end

  def authentic_user
    @authentic_users=AuthenticUser.all
  end

  def genre
    @genres=Genre.all
  end

  def gender
    @genders=Gender.all
  end

  def instrument
    @instruments=Instrument.all
  end

  def prefecture
    @prefectures=Prefecture.all
  end

  def audio
    @audios=Audio.all
  end

  def audio_tag
    @audio_tags=AudioTag.all
  end

  def audio_tagmap
    @audio_tagmaps=AudioTagmap.all
  end
end
