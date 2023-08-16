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
    puts 'Adding a book'
    puts 'Enter book title:'
    title = gets.chomp.capitalize
    puts 'Enter book published date:'
    gets.chomp
    puts 'Enter book Color:'
    color = gets.chomp.capitalize
    puts 'Enter book publisher:'
    publisher = gets.chomp.capitalize
    puts 'Enter book cover state "Good or bad":'
    cover_state = gets.chomp.capitalize
    label = Label.new(title, color)
    @labels << label
    book = Book.new(label, publisher, cover_state)
    @books << book
    save_books
    save_labels
    puts "The book #{book.label.title} was added successfully👏"
  end

  def list_all_books
    puts 'Here are all the books:'
    @books.each_with_index do |bk, index|
      puts "#{index + 1}: Title: #{bk.label.title}  Color: #{bk.label.color} Cover state: #{bk.cover_state}"
    end
  end

  def list_all_labels
    puts 'Here are all the labels:'
    @labels.each_with_index do |lb, index|
      puts "#{index + 1}: Title: #{lb.title} color: #{lb.color}"
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
      label_title = book_data['title']
      label_color = book_data['color']

      label = @labels.find { |lb| lb.title == label_title && lb.color == label_color }
      next unless label

      book = Book.new(label: label, published_date: book_data['published_date'], publisher: book_data['publisher'],
                      cover_state: book_data['cover_state'])
      @books << book
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
end
