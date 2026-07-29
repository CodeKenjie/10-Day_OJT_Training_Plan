# Deliverabel 3 : Data manipulation
books = [
  { title: "Ruby Basics", pages: 150, available: true },
  { title: "Eloquent Ruby", pages: 320, available: false },
  { title: "The Pragmatic Programmer", pages: 352, available: true }
]

def view(collection)
  if collection.empty?
    puts "No books found."
    return
  end

  collection.each do |book|
    puts "#{book[:title]}, Pages: #{book[:pages]}, Available: #{book[:available] ? "Yes" : "No"}"
  end
end

def add(collection)
  print "Book title: "
  title = gets.chomp

  print "Pages: "
  pages = gets.chomp.to_i

  print "Available? (yes/no): "
  available = gets.chomp.downcase == "yes"

  collection << {
    title: title,
    pages: pages,
    available: available
  }

  puts "Book added!"
end

def search(collection)
  print "Enter book title: "
  keyword = gets.chomp.downcase

  results = collection.select do |book|
    book[:title].downcase.include?(keyword)
  end

  if results.empty?
    puts "No books found."
  else
    view(results)
  end
end

def update(collection)
  print "Enter the title of the book to update: "
  title = gets.chomp.downcase

  book = collection.find { |b| b[:title].downcase == title }

  if book.nil?
    puts "Book not found."
    return
  end

  print "New title: "
  book[:title] = gets.chomp

  print "New pages: "
  book[:pages] = gets.chomp.to_i

  print "Available? (yes/no): "
  book[:available] = gets.chomp.downcase == "yes"

  puts "Book updated!"
end

def delete(collection)
  print "Enter the title of the book to delete: "
  title = gets.chomp.downcase

  removed = collection.reject! do |book|
    book[:title].downcase == title
  end

  if removed
    puts "Book deleted!"
  else
    puts "Book not found."
  end
end

loop do
  puts
  puts "====== Book Manager ======"
  puts "[all]    View all books"
  puts "[search] Search books"
  puts "[add]    Add a book"
  puts "[update] Update a book"
  puts "[delete] Delete a book"
  puts "[exit]   Exit"
  print "Action: "

  action = gets.chomp.downcase

  case action
  when "all"
    view(books)
  when "search"
    search(books)
  when "add"
    add(books)
  when "update"
    update(books)
  when "delete"
    delete(books)
  when "exit"
    puts "Goodbye!"
    break
  else
    puts "Invalid command."
  end
end
