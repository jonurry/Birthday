require './lib/birth_dates'

describe BirthDates do
  subject(:birth_dates) { described_class.new }

  before(:each) do
    date_today = Date.new(2018, 9, 20)
    allow(Date).to receive(:today).and_return(date_today)
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

  it 'should give number of days to today' do
    expect(birth_dates.days_to_birthday(20, 9)).to be_zero
  end

end
