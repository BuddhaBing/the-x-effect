feature 'viewing tasks' do
  context 'no tasks exist' do
    it 'displays a message that no tasks exist yet' do
      sign_up
      visit '/'
      expect(page).to have_content("No tasks yet")
    end
  end
  context 'active tasks exist' do
    before do
      sign_up
      new_task
    end
    it 'displays a list of active tasks' do
      expect(current_path).to eq("/")
      expect(page).to have_content("Meditate")
    end
    it 'allows the user to click a task and be taken to that task\'s page' do
      click_link "Meditate"
      expect(current_path).to eq("/tasks/#{Task.first.id}")
    end
  end
end
