class GenderController < ApplicationController
  before_action :sign_in_required
  def update
    @gender=Gender.find_by(user_id: @current_user.id)
    if @gender.update(gender_params)
      redirect_to "/profile/#{@current_user.public_uid}", notice: '性別を変更しました！'
    else
      redirect_to "/profile/#{@current_user.public_uid}", notice: 'エラーが発生したため、もう一度設定し直してください'
    end
  end

  private
  def gender_params
    params.require(:gender).permit(:gender)
  end
end
