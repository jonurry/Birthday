class BirthDates
  def days_to_birthday(day, month)
    today = Date.today
    year = today.year
    if (month == today.month and day < today.day) ||
       (month < today.month)
       year += 1
    end
    (today..Date.new(year, month, day)).count - 1
  end
end
