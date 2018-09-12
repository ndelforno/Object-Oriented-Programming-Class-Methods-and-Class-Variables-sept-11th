class Book

  @@on_shelf = []
  @@on_loan = []

  # reader methods
  def due_date
    return @due_date
  end

  def self.on_loan
    return @@on_loan
  end

  def self.on_shelf
    return @@on_shelf
  end

  # writers methods
  def due_date=(date)
    @due_date = date
  end

  def initialize(title,author,isbn)
    @book_title = title
    @author = author
    @isbn = isbn
    @due_date = nil
  end

  def self.create(title,author,isbn)
    book = Book.new(title,author,isbn)
    @@on_shelf << book
    return book
  end

  def self.available
    return @@on_shelf
  end

  def self.borrowed
    return @@on_loan
  end

  def self.browse
    return @@on_shelf.sample
  end

  def lent_out?(book)
    if @@on_loan.include?(book) == true
      return true
    else
      return false
    end
  end

  def self.current_due_date(book)
      return @due_date = Time.now + 3600
  end

  def borrow(book)
    if book.lent_out?(book) == true
      puts "Book unvailable"
    else
      @due_date = Book.current_due_date(book)
      @@on_shelf.delete(book)
      @@on_loan << book
      return true
    end
  end

  def return_to_library(book)
    if book.lent_out?(book) == true
      @@on_shelf << book
      @@on_loan.delete(book)
      @due_date = nil
      return true
    else
      return false
    end
  end

  def self.overdue
    overdue_books = []
    @@on_loan.each do |book|
      if book.due_date < Time.now
      overdue_books << book
      end
    end
  end
end

book1 = Book.create("Sister Outsider","Audre Lorde","9781515905431")
p book1
book2 = Book.create("Ain't I a Woman?", "Bell Hooks", "9780896081307")
p book2
book3 = Book.create("If They Come in the Morning", "Angela Y. Davis", "0893880221")
p book3

puts "------"
p Book.on_shelf
puts "------"
puts Book.browse.inspect
puts "------"
puts Book.available.inspect
puts "------"
puts Book.borrowed.inspect
puts "------"
puts book1.lent_out?(book1)
puts book1.borrow(book1)
puts Book.borrowed.inspect
puts book1.due_date
# puts "------"
# puts book1.lent_out?(book1)
# puts "--------"
puts book1.return_to_library(book1)
puts book1.lent_out?(book1)
puts Book.overdue.inspect
