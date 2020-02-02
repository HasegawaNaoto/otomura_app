class GenreController < ApplicationController
  before_action :create_genre,{only:[:create,:new]}
  before_action :update_genre,{only:[:update,:destroy,:edit]}

  def new
  end

  def edit
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user_id=@current_user.id

    respond_to do |format|
      if @genre.save
        format.html { redirect_to "/posts/index", notice: 'ジャンルを作成しました！' }
        format.json { render "posts/index", status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to "/profile/#{@current_user.public_uid}", notice: 'ジャンルを変更しました！' }
        format.json { render "profile/#{@current_user.public_uid}", status: :ok, location: @genre }
      else
        format.html { render "profile/#{@current_user.public_uid}"}
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_genre
    @user=@current_user
    @genre=Genre.find_by(user_id: @current_user.id)
  end

  def create_genre
    @user=User.new
    @genre=Genre.new
  end

  def genre_edit
  end

  private
  def genre_params
    params.require(:genre).permit(:rock,:punk,:pop,:ambient,:alternative,:classic,:jazz,:hard_rock,:progressive,:pop_punk,:heavy_metal,:metalcore,:emo,:merocore,:hiphop,:instrument,:western,:japanese,:acoustic,:other1,:other2,:other3,:other4,:other5)
  end
end
