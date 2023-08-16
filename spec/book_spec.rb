require_relative '../models/book'

describe Book do
    before :each do
        @book1 = Book.new(published_date: '2023-12-01', label: 'Ruby', publisher: 'Phoenix', cover_state: 'Good')
        @book2 = Book.new(published_date: '2010-12-01', label: 'Ruby', publisher: 'Phoenix', cover_state: 'Good')
        @book3 = Book.new(published_date: '2023-12-01', label: 'Ruby', publisher: 'Phoenix', cover_state: 'Bad')
    end
    describe '#can_be_archived?' do
        it 'Returns false when date is <10years or when cover_state is good.' do
            expect(@book1.can_be_archived?).to be false
        end
    end
    describe '#can_be_archived?' do
        it 'Returns true when date is >10years or when cover_state is bad.' do
            expect(@book2.can_be_archived?).to be true
        end
    end
    describe '#can_be_archived?' do
        it 'Returns true when date is <10years or when cover_state is bad.' do
            expect(@book3.can_be_archived?).to be true
        end
    end
end

