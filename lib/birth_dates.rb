class BirthDates
  def days_to_birthday(day, month)
    today = Date.today
    year = today.year
    birthday = Date.new(year, month, day)
    birthday = Date.new(year + 1, month, day) if birthday < today
    (birthday - today).to_i
  end
end
