class BooksController < ApplicationController
  def index
    # viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @book = Book.new
    @books = Book.all
  end
  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_path(book.id)
  end
  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book)
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path(book)
  end
  
  private
  #以下ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
