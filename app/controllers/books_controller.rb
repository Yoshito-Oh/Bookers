class BooksController < ApplicationController
  def index
    # viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
    @books = Book.all
  end
  def create
   @book = Book.new(book_params)
   @books = Book.all
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
   @book = Book.find(params[:id])
    if @book.update(book_params)
      @books = Book.all
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully deleted."
    redirect_to books_path(book)
  end

  private
  #以下ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, :opinion)
  end

end
