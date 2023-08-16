require_relative 'book'
require_relative 'label'
require 'date'

class BookHandler
  def initialize
    @books = []
    @labels = []
  end

  def input_book
  end

  def add_book(book)
    puts 'Enter book title:'
    title = gets.chomp.capitalize
    puts 'Enter book published date:'
    publish_date = gets.chomp
    puts 'Enter book Color:'
    color = gets.chomp.capitalize
    puts 'Enter book publisher:'
    publisher = gets.chomp.capitalize
    puts 'Enter book cover state "Good or bad":'
    cover_state = gets.chomp.capitalize
    label = Label.new(title, color)
    @labels << label
    inputs = { publish_date: publish_date, publisher: publisher, cover_state: cover_state, label: label }
    book = Book.new(inputs)
    @books << book
    puts "The book #{book.label.title} was added successfully👏"
  end

  def list_all_books
    @books.each_with_index do |bk, index|
      puts "#{index + 1}: Title: #{bk.label.title} ID: #{bk.id} Cover state: #{bk.cover_state}"
    end
  end

  def list_all_labels
    @labels.each_with_index do |lb, index|
      puts "#{index + 1}: Title: #{lb.title} color: #{lb.color}"
    end
  end

  def save_books
    books_data = @books.each do |book|
      {
        'publish_date' => book.publish_date,
        'publisher' => book.publisher,
        'cover_state' => book.cover_state,
        'label' => book.label
      }
    end
    File.write('books.json', JSON.generate(books_data))
  end

  def load_books
    return unless File.exist?('books.json')
    books_data = JSON.parse(File.read('books.json'))
    books_data.each do |book_data|
      book = Book.new(publish_date: book_data['publish_date'], publisher: book_data['publisher'], cover_state: book_data['cover_state'], label: book_data['label'])
      @books << book
    end
  end

  def save_labels
   label_data = @labels.each do |label|
    {
      'title': label.title,
      'color': label.color
    }

    end
    File.write('labels.json', generate.JSON(label_data))
  end

  def load_labels
    unless File.exist?('labels.json')
      puts 'No labels found.'
      return
    end
    labels_data = JSON.parse(File.read('labels.json'))

    labels_data.each do |label_data|
      label = Label.new(label_data['title'], label_data['color'])
      labels << label
    end

    puts 'labels loaded successfully!'
  end
end
