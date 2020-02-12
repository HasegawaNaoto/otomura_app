class PostsController < ApplicationController
  before_action :comment_notice_destroy,{only:[:destroy]}
  before_action :recomended_user,{only:[:index,:show]}
  before_action :sign_in_required

  def comment_notice_destroy
    if @current_user
      @post=Post.find_by(id: params[:id])
      @comments=Post.where(comment_id: @post.id)
      @notices=Notice.all
      @notices.each do |notice|
        @comments.each do |comment|
        if notice.comment_id==@post.id || notice.like_id==@post.id || notice.comment_id==comment.id
          notice.destroy
        end
      end
      end
    end
  end

  def index
    @serch=Serch.new
    @post=Post.new
    @posts=Post.all.order(created_at: :desc)
    @index=params[:index]
    @follow=Follow.where(user_id: @current_user.id)
    @follower=Follow.where(follow_id: @current_user.id)
  end

  def show
    @post=Post.find_by(id: params[:id])
    @follow=Follow.where(user_id: @current_user.id)
    @follower=Follow.where(follow_id: @current_user.id)
  end

  def newpost
  end

  def editcontent
    @posts=Post.find_by(id: params[:id])
  end

  def edit
    @posts=Post.find_by(id: params[:id])
    @posts.content=params[:content]
    if @posts.save
      redirect_to("/posts/index")
    else
      render("posts/editcontent")
    end
  end

  def destroy
    @posts=Post.find_by(id: params[:id])
    @posts.destroy
    @likes=Like.where(post_id: @posts.id)
    @likes.destroy_all
    @comments=Post.where(comment_id: @posts.id)
    @comments.destroy_all
    flash[:notice]="投稿を削除しました"
    redirect_to("/posts/index")
  end

  def create
    @posts=Post.all.order(created_at: :desc)
    @post=@current_user.posts.build(post_params)
    @post.save
    flash[:notice]="投稿が完了しました"
    redirect_back(fallback_location: "/posts/index")
  end

  def logout
    session[:user_id]=nil
    redirect_to("/")
  end

  def serching
    @serch_word=params[:serch]
    if @serch_word!=""
      @serch_word_infomation=Serch.find_by(word: @serch_word,user_id: @current_user.id)
      if @serch_word_infomation
        @serch_word_infomation.destroy
      end
      @new_serch_word_infomation=Serch.new(word: params[:serch],user_id: @current_user.id)
      @new_serch_word_infomation.save
      redirect_to("/posts/serch/#{@serch_word}")
    else
      flash[:notice]="検索ワードを入れてください"
      redirect_back(fallback_location: "/posts/index")
    end
  end

  def serch
    @serch_word=params[:serch]
    @serch_words=Serch.where(user_id: @current_user.id)
    @serch_posts=Post.where("content LIKE?","%#{@serch_word}%").order(created_at: :desc)
  end

  def comment
    @post=Post.find_by(id: params[:id])
    @recomended_users=User.where("content LIKE?","%エンジニア%").limit(5)
    @recomended_users=@recomended_users.shuffle
  end

  def imgshow
    @posts=Post.all.order(created_at: :desc)
    @post=Post.find_by(id: params[:id])
    @index=params[:index]
  end

  def recomended_user
    @serch_users=User.where.not(id:@current_user.id).shuffle
  end

  private
  def post_params
    params.require(:post).permit(:content,:video,{images:[]})
  end
end
