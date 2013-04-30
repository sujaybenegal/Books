class BooksController < ApplicationController

  def index
    books = Book.fetch_books
    @books = Kaminari.paginate_array(books).page(params[:page]).per(10)
  end
end
