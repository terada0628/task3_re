class BooksController < ApplicationController

before_action :book_all

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
   if @new_book.save
    redirect_to book_path(@new_book[:id]), notice: 'You have created book successfully.'
   else
    @user = current_user
    render :index
   end
  end

  def index
    @new_book = Book.new
    @user = current_user
    # @books = Book.all   before_actionで定義済み
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    # @books = Book.all  before_actionで定義済み
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id), notice: 'You have updated book successfully.'
    else render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end
  
  # booksの定義を全アクションで指定
  def book_all
    @books = Book.all
  end


end

