class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = @user.book(params[:id])
  end
end
