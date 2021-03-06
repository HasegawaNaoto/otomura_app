class CommentController < ApplicationController
  after_action :comment_notice_create,{only:[:create]}
  before_action :sign_in_required

  def comment_notice_create
    if @current_user
      @post=Post.find_by(id: params[:id])
      @comment=Post.find_by(comment_id: params[:id],User_id: @current_user.id)
      if @post.user_id!=@current_user.id
        @notice=Notice.new
        @notice.user_id=@current_user.id
        @notice.visited_id=@post.user_id
        @notice.comment_id=@comment.id
        @notice.save
      end
    end
  end

  def commentform
    @posts=Post.all.order(created_at: :desc)
    @post=Post.find_by(id: params[:id])
  end

  def create
    @post=Post.find_by(id: params[:id])
    @posts=Post.all.order(created_at: :desc)
    @comment=Post.new(comment_params)
    @comment.comment_id=@post.id
    @comment.user_id=@current_user.id
    @comment.save
    flash[:notice]="コメントしました"
    redirect_to("/posts/show/#{@comment.id}")
  end

  def show
    @post=Post.find_by(id: params[:id])
  end

  private
  def comment_params
    params.require(:post).permit(:content,:video,{images:[]})
  end
end
