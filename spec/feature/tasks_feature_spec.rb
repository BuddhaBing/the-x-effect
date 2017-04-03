feature 'viewing tasks' do
  context 'no tasks exist' do
    it 'displays a message that no tasks exist yet' do
      sign_up
      visit '/'
      expect(page).to have_content("No tasks yet")
    end
  end
  context 'active tasks exist' do
    it 'displays a list of active tasks' do
      sign_up
      new_task
      expect(current_path).to eq("/")
      expect(page).to have_content("Meditate")
    end
  end
end
