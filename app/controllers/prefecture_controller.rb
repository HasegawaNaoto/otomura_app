class PrefectureController < ApplicationController
  before_action :sign_in_required
  def update
    @prefecture=Prefecture.find_by(user_id: @current_user.id)
    if @prefecture.update(prefecture_params)
      redirect_to "/profile/#{@current_user.public_uid}", notice: '地域を変更しました！'
    else
      redirect_to "/profile/#{@current_user.public_uid}", notice: 'エラーが発生したため、もう一度設定し直してください'
    end
  end

  private
  def prefecture_params
    params.require(:prefecture).permit(:area)
  end
end
