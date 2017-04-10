feature 'Creating a task' do
  context 'user is logged in' do
    it 'user can create a task' do
      sign_up
      expect(page).to have_link "New Task"
      expect{new_task}.to change{Task.count}.by(1)
    end
  end
  context 'user is not logged in' do
    it 'user cannot create a task' do
      visit '/'
      expect(page).not_to have_link "New Task"
    end
  end
  context 'checking validity' do
    before do
      sign_up
    end
    it 'does not allow to create a task with no name' do
      new_task(nil)
      expect(page).to have_content("Name can't be blank")
    end
    it 'does not allow to create a task with start date in the the past' do
      new_task("Exercise", "For at least 30 mins", Date.parse("01/01/2017"))
      expect(page).to have_content("Start date can't be in the past")
    end
    it 'does not allow to create a task with end date prior to the start date' do
      new_task("Exercise", "For at least 30 mins", "02/01/3017", "01/01/3017")
      expect(page).to have_content("End date can't be before the start date")
    end
  end
end
feature 'marking dates on a task' do
  before do
    sign_up
    new_task
    click_link "Meditate"
  end
  it 'displays all of the dates for the task\'s duration' do
    date = Date.today.strftime("%a %d/%m/%Y")
    expect(page).to have_content date

  end
end
