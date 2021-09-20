class BooksController < ApplicationController
  # def new
  # end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = @book.user
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    # @user = User.find(params[:id])
    @book = Book.find(params[:id])
    @new_book = Book.new
    @books = Book.all
    @user = @book.user
  # def show
  #   @books = Book.find(params[:id])
  #   @user = User.find(params[:id])
  #   @book = @user.books
  #   @new_book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
      
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      @user = @book.user
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
