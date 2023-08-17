require_relative '../models/book'
require_relative '../models/label'

describe Book do
  before(:each) do
    @books = []
    @labels = []

    @label = Label.new('Title1', 'Color1')
    @labels << @label

    @book = Book.new(@label, '2021-01-01', 'Publisher1', 'Good')
    @book1 = Book.new(@label, '2010-01-01', 'Publisher1', 'Good')
    @book2 = Book.new(@label, '2021-01-01', 'Publisher1', 'Bad')
    @books << @book
  end
  describe '#initialize' do
  it 'should be able to add a publisher' do
    expect(@books[0].publisher).to eq('Publisher1')
  end

  it 'should be able to add a cover state' do
    expect(@books[0].cover_state).to eq('Good')
  end

  it 'should be able to add a label' do
    expect(@books[0].label).to eq(@label)
  end

  it 'should be able to add a published date' do
    expect(@books[0].published_date).to eq('2021-01-01')
  end

  it 'should be able to add a title' do
    expect(@books[0].label.title).to eq('Title1')
  end

  it 'should be able to add a color' do
    expect(@books[0].label.color).to eq('Color1')
  end

  it 'should be able to add a book' do
    expect(@books[0]).to be_an_instance_of(Book)
  end

  it 'should be able to add a label' do
    expect(@labels[0]).to be_an_instance_of(Label)
  end
end


  describe '#can_be_archived?' do
    it 'Returns false when date is <10years or when cover_state is good.' do
      expect(@book.can_be_archived?).to be false
    end
  
  
    it 'Returns true when date is >10years or when cover_state is bad.' do
      expect(@book1.can_be_archived?).to be true
    end

 
    it 'Returns true when date is <10years or when cover_state is bad.' do
      expect(@book2.can_be_archived?).to be true
    end
  end
end
