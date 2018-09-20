class BirthDates
  def days_to_birthday(day, month)
    today = Date.today
    today_day = today.day
    today_month = today.month
    today_year = today.year
    year = today_year
    if (month == today_month and day < today_day) ||
       (month < today_month)
       year += 1
    end
    (today..Date.new(year, month, day)).count - 1
  end
end
