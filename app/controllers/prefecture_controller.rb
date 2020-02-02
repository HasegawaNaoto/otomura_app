class PrefectureController < ApplicationController
  before_action :update_prefecture,{only:[:update]}
  def update
    respond_to do |format|
      if @prefecture.update(prefecture_params)
        format.html { redirect_to "/profile/#{@current_user.public_uid}", notice: '地域を変更しました！' }
        format.json { render "profile/#{@current_user.public_uid}", status: :ok, location: @prefecture }
      else
        format.html { render "profile/#{@current_user.public_uid}" }
        format.json { render json: @prefecture.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_prefecture
    @prefecture=Prefecture.find_by(user_id: @current_user.id)
  end

  private
  def prefecture_params
    params.require(:prefecture).permit(:area)
  end
end
