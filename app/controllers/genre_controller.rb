class GenreController < ApplicationController
  before_action :sign_in_required
  def update
    @genre=Genre.find_by(user_id: @current_user.id)
    if @genre.update(genre_params)
      redirect_to "/profile/#{@current_user.public_uid}", notice: 'ジャンルを変更しました！'
    else
      redirect_to "/profile/#{@current_user.public_uid}", notice: 'エラーが発生したため、もう一度設定し直してください'
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:rock,:punk,:pop,:ambient,:alternative,:classic,:jazz,:hard_rock,:progressive,:pop_punk,:heavy_metal,:metalcore,:emo,:merocore,:hiphop,:instrument,:western,:japanese,:acoustic,:other1,:other2,:other3,:other4,:other5)
  end
end
