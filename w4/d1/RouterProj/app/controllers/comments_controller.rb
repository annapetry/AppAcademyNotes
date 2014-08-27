class CommentsController < ApplicationController
  
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
  
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
    render json: @comments
  end
  
  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def destroy
    @commentable = find_commentable
    @comment = @commentable.comments.build(comment_params)
    @comment.destroy
    render json: @comment
  end
  
  private
  def comment_params
    params
      .require(:comment)
      .permit(:commentable_id, :commentable_type, :content)
  end
  
end
