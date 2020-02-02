class GenderController < ApplicationController
  before_action :create_gender,{only:[:create,:new]}
  before_action :update_gender,{only:[:update,:destroy,:edit]}

  def new
  end

  def edit
  end

  def create
    @gender = Gender.new(gender_params)
    @gender.user_id=@current_user.id
    
    respond_to do |format|
      if @gender.save
        format.html { redirect_to "/posts/index", notice: '性別を設定しました！' }
        format.json { render "posts/index", status: :created, location: @gender }
      else
        format.html { render :new }
        format.json { render json: @gender.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gender.update(gender_params)
        format.html { redirect_to "/profile/#{@current_user.public_uid}", notice: '性別を変更しました！' }
        format.json { render "profile/#{@current_user.public_uid}", status: :ok, location: @gender }
      else
        format.html { render "profile/#{@current_user.public_uid}"}
        format.json { render json: @gender.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gender.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: 'Genre was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def update_gender
    @user=@current_user
    @gender=Gender.find_by(user_id: @current_user.id)
  end

  def create_gender
    @user=User.new
    @gender=Gender.new
  end

  private
  def gender_params
    params.require(:gender).permit(:gender)
  end
end
