require_relative 'book'
require_relative 'label'
require 'date'

class BookHandler
  def initialize
    @books = []
    @labels = []
    load_books
    load_labels
  end

  def add_book
    puts "\nAdding a book"

    puts "\nEnter book title:"
    title = gets.chomp.capitalize

    puts "\nEnter book published date:"
    published_date = gets.chomp

    puts "\nEnter book Color:"
    color = gets.chomp.capitalize

    puts "\nEnter book publisher:"
    publisher = gets.chomp.capitalize

    puts "\nEnter book cover state 'Good' or 'bad':"
    cover_state = gets.chomp.capitalize

    label = Label.new(title, color)
    @labels << label
    book = Book.new(label, published_date, publisher, cover_state)
    @books << book
    puts "\nThe book '#{book.label.title}' was added successfully👏"
  end

  def list_all_books
    if @books.empty?
      puts "\nNo books were found. Feel free to add a new book."
    else
      puts "\nHere are all the books:"
      @books.each_with_index do |bk, index|
        puts "#{index + 1}: Title: #{bk.label.title}, Book color: #{bk.label.color}, Cover state: #{bk.cover_state}"
        puts '---------------------------------------------------'
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts "\nNo labels were found. Feel free to add a new book."
    else
      puts "\nHere are all the labels:"
      @labels.each_with_index do |lb, index|
        puts "#{index + 1}: Title: #{lb.title}, color: #{lb.color}"
        puts '---------------------------------------------------'
      end
    end
  end

  def save_books
    books_data = @books.map do |book|
      {
        published_date: book.published_date,
        publisher: book.publisher,
        cover_state: book.cover_state,
        title: book.label.title,
        color: book.label.color
      }
    end
    File.write('books.json', JSON.generate(books_data))
  end

  def load_books
    return unless File.exist?('books.json')

    books_data = JSON.parse(File.read('books.json'))
    books_data.each do |book_data|
      label = Label.new(book_data['title'], book_data['color'])
      book = Book.new(label, book_data['published_date'], book_data['publisher'], book_data['cover_state'])
      @books << book
      puts 'Books loaded successfully👏'
    end
  end

  def save_labels
    label_data = @labels.map do |label|
      {
        title: label.title,
        color: label.color
      }
    end
    File.write('labels.json', JSON.generate(label_data))
  end

  def load_labels
    return unless File.exist?('labels.json')

    labels_data = JSON.parse(File.read('labels.json'))
    labels_data.each do |label_data|
      label = Label.new(label_data['title'], label_data['color'])
      @labels << label
    end
  end

  def save_books_and_labels
    save_books
    save_labels
  end
end
