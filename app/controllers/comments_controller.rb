class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.invalid?
      logger.debug "DEBUG: INVALID #{@comment.errors.full_messages} #{__method__}, #{__FILE__}:#{__LINE__}"
      render :create, status: :unprocessable_entity
    else
      redirect_to article_path(@article)
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :status)
    end

end
