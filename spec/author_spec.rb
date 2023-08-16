require_relative '../author'

describe Author do
  before :each do
    @author = Author.new('Clinton', 'Younge')
  end

  it 'should have a first name' do
    expect(@author.first_name).to eq('Clinton')
  end

  it 'should have a last name' do
    expect(@author.last_name).to eq('Younge')
  end
end
