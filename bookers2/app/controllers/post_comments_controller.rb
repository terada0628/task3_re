class PostCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.post_comments.new(post_comment_params)
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id の意味
    comment.book_id = book.id
    if comment.save
    redirect_to book_path(book)
    else
    redirect_to book_path(book)
  end
  end

  def destroy
    PostComment.find_by(id: params[:id],book_id: params[:book_id]).destroy
    # post_comment = PostComment.find(id:params[:id], book_id: params[:book_id])
    # post_comment.destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
