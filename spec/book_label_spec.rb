require_relative '../models/book'
require_relative '../models/label'

describe Book do
  before(:each) do
    @books = []
    @labels = []

    @label = Label.new('Title1', 'Color1')
    @labels << @label

    @book = Book.new(@label, '2021-01-01', 'Publisher1', 'Good')
    @books << @book
  end

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
