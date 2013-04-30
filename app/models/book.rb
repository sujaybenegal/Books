class Book < ActiveRecord::Base
  attr_accessible :authors, :image_link, :title, :description

  def self.fetch_books
    first_record = self.first
    if first_record.nil? or first_record.created_at.to_date != Date.today # check if there is no record in the table or records are not up-to-date
      Book.delete_all unless first_record.nil?
      begin
        books = GoogleBooks.search("Ruby on Rails", {:count => 40}).to_a
      rescue Exception => e
        Rails.logger.info "The following error prevented Google API code to execute"
        Rails.logger.info e
        books = []
      end
      unless books.empty?
        books.each do |book|
          Book.create(:title => book.title, :authors => book.authors, :image_link => book.image_link, :description => book.description)
        end
      end
      books = Book.all
    else
      books = Book.all
    end
    return books
  end

end