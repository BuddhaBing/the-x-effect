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
  context 'checking valid dates' do
    before do
      sign_up
    end
    it 'does not allow to create a task with start date in the the past' do
      new_task("Exercise", "01/01/2017")
      expect(page).to have_content("Start date cannot be in the past")
    end
  end
end
