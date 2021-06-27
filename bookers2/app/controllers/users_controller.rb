class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @new_book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:name,:profile_image_id,:introduction)
  end

end
