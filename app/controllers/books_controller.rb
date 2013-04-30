class BooksController < ApplicationController

  def index
#    @books = GoogleBooks.search('The Great Gatsby')
  end

  def search
    books = GoogleBooks.search(params[:book][:info], {:count => 15}).to_a
    @books = Kaminari.paginate_array(books).page(params[:page]).per(10)
  end
end
