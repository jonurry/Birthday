require './lib/birth_dates'

describe BirthDates do
  subject(:birth_dates) { described_class.new }

  before(:each) do
    date_today = Date.new(2018, 9, 20)
    allow(Date).to receive(:today).and_return(date_today)
  end

  context 'when birthday is today' do
    it 'should give number of days to today' do
      expect(birth_dates.days_to_birthday(20, 9)).to be_zero
    end
  end

  context 'when date is next month' do
    it 'should give number of days to future date' do
      expect(birth_dates.days_to_birthday(7, 10)).to eq 17
    end
  end

  context 'when date is last month' do
    it 'should give number of days in roughly 11 months time' do
      expect(birth_dates.days_to_birthday(20, 8)).to eq (365 - 31)
    end  
  end

  context 'when date is earlier this month' do
    it 'should give number of days to date almost a year away' do
      expect(birth_dates.days_to_birthday(10, 9)).to eq (365 - 10)
    end  
  end

  context 'when date is later this month' do
    it 'should give number of days to date in near future' do
      expect(birth_dates.days_to_birthday(25, 9)).to eq 5
    end  
  end

  describe 'leap years' do
    context 'when the date crosses a leap year boundary' do
      it 'should give correct number of days' do
        date_today = Date.new(2020, 2, 20)
        allow(Date).to receive(:today).and_return(date_today)
        expect(birth_dates.days_to_birthday(10, 3)).to eq 19
      end
    end

    context 'when the date crosses a non-leap year boundary' do
      it 'should give correct number of days' do
        date_today = Date.new(2019, 2, 20)
        allow(Date).to receive(:today).and_return(date_today)
        expect(birth_dates.days_to_birthday(10, 3)).to eq 18
      end
    end
  end
end
