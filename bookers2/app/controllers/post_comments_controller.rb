class PostCommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @post_comment = current_user.post_comments.new(post_comment_params)
    # comment = PostComment.new(post_comment_params)
    # comment.user_id = current_user.id の意味
    @post_comment.book_id = @book.id
    if @post_comment.save
    redirect_to book_path(@book), notice: 'You have created comment  successfully.'
    else
    @new_book = Book.new
    @book = Book.find(params[:book_id])
    @user = @book.user
    render template: "books/show"
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
