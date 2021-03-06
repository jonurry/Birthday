require './app'

feature 'Enter name and birthday' do
  before(:each) do
    date_today = Date.new(2018, 9, 20)
    allow(Date).to receive(:today).and_return(date_today)
  end

  scenario 'Birthday is in the future' do
    name = 'Jon'
    day = 7
    month = 10
    visit('/')
    fill_in(:name, with: name)
    fill_in(:day, with: day)
    find('#month').find(:xpath, "option[#{month}]").select_option
    click_button('Go!')
    expect(page).to have_content("Your birthday will be in #{17} days, #{name}")
  end

  scenario 'Birthday is today' do
    name = 'Barnie'
    day = 20
    month = 9
    visit('/')
    fill_in(:name, with: name)
    fill_in(:day, with: day)
    find('#month').find(:xpath, "option[#{month}]").select_option
    click_button('Go!')
    expect(page).to have_content("It's your birthday, #{name}!!!")
  end
end
