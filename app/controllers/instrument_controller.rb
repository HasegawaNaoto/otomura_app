class InstrumentController < ApplicationController
  before_action :sign_in_required
  def update
    @instrument=Instrument.find_by(user_id: @current_user.id)
    if @instrument.update(genre_params)
      redirect_to "/profile/#{@current_user.public_uid}", notice: 'ジャンルを変更しました！'
    else
      redirect_to "/profile/#{@current_user.public_uid}", notice: 'エラーが発生したため、もう一度設定し直してください'
    end
  end

  private
  def genre_params
    params.require(:instrument).permit(:vocal,:guiter,:bass,:drum,:key,:dj,:sax,:violin,:other)
  end
end
