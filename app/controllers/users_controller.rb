class UsersController < ApplicationController
  def index
    @users = User.all
    @new_book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)

      redirect_to user_path(@user.id)
    else
      render 'edit'
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :user_id)
  end
end
