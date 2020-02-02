class InstrumentController < ApplicationController
  before_action :create_instrument,{only:[:create,:new]}
  before_action :update_instrument,{only:[:update,:destroy,:edit]}

  def new
  end

  def edit
  end

  def create
    @instrument = Instrument.new(genre_params)
    @instrument.user_id=@current_user.id

    respond_to do |format|
      if @instrument.save
        format.html { redirect_to "/posts/index", notice: '使用楽器を設定しました！' }
        format.json { render "posts/index", status: :created, location: @genre }
      else
        format.html { render :new }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @instrument.update(genre_params)
        format.html { redirect_to "/profile/#{@current_user.public_uid}", notice: 'ジャンルを変更しました！' }
        format.json { render "profile/#{@current_user.public_uid}", status: :ok, location:@instrument }
      else
        format.html { render "profile/#{@current_user.public_uid}" }
        format.json { render json: @instrument.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_instrument
    @user=@current_user
    @instrument=Instrument.find_by(user_id: @current_user.id)
  end

  def create_instrument
    @user=User.new
    @instrument=Instrument.new
  end

  private
  def genre_params
    params.require(:instrument).permit(:vocal,:guiter,:bass,:drum,:key,:dj,:sax,:violin,:other)
  end
end
