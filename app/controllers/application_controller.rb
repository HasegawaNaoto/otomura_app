class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :self_user
  before_action :current_user_notice_action
  before_action :create_details_profile
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def current_user_notice_action
    if @current_user
      @self_user_notices=Notice.where.not(user_id:@current_user.id).where(visited_id:@current_user.id,checked: false)
      @self_user_notice=[]
      @i=0
      @self_user_notices.each do |self_user_notice|
        @self_user_notice[@i]=self_user_notice
        @i=@i+1
      end

      @notices_count=Notice.where.not(user_id:@current_user.id).where(visited_id:@current_user.id,checked: false).count
    end
  end

  def self_user
    @current_user=current_user
  end

  def create_details_profile
    if @current_user
      current_user_gender = Gender.find_by(user_id: @current_user.id)
      current_user_instrument = Instrument.find_by(user_id: @current_user.id)
      current_user_genre = Genre.find_by(user_id: @current_user.id)
      current_user_prefecture=Prefecture.find_by(user_id: @current_user.id)

      unless current_user_prefecture
        current_user_prefecture = @current_user.prefectures.create
      end

      unless current_user_gender
        current_user_gender = @current_user.genders.create
      end

      unless current_user_instrument
        current_user_instrument = @current_user.instruments.create
      end

      unless current_user_genre
        current_user_genre = @current_user.genres.create
      end
    end
  end

  def forbid_login_user
    if @current_user
      flash[:notice]="既にログインしてます。"
      redirect_to("/posts/index")
    end
  end

  def after_sign_in_path_for(resource)
    "/posts/index"
  end

  def after_sign_out_path_for(resource)
    "/"
  end

  private
  def sign_in_required
    redirect_to new_user_session_url unless user_signed_in?
  end
end
