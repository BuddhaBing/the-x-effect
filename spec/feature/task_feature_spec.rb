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
end
