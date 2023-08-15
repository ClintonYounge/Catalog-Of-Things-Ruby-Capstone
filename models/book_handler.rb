require_relative 'book'
require_relative 'label'
require 'date'

class BookHandler
  def initialize
    @books = []
    @labels = []
  end

  def add_book
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
end
