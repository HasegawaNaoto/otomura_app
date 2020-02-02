class HomeController < ApplicationController
  def top
    @user=User.new
  end

  def about
  end

  def newform
  end

  def newcreate
    @users=User.new
    @users.name=params[:name]
    @users.email=params[:email]
    @users.image="default.png"
    @users.background="default.png"
    @users.password=params[:password]
    @users.save
    @genre=Genre.new
    @gender=Gender.new
    @instrument=Instrument.new
    @genre.user_id=@users.id
    @gender.user_id=@users.id
    @instrument.user_id=@users.id
    @genre.save
    @gender.save
    @instrument.save
    session[:user_id]=@users.id
    redirect_to("/posts/index")
  end

  def login
    @user=User.find_by(login_params)
    if @user
      session[:user_id]=@user.id
      flash[:notice]="ログインしました！"
      redirect_to("/posts/index")

    else
      @error_message="メールアドレスまたはパスワードが間違っています！"
      @email=params[:email]
      @password=params[:password]
      redirect_to("/")
    end

  end

  def loginform
  end

  private
  def login_params
    params.require(:user).permit(:email,:password)
  end
end
