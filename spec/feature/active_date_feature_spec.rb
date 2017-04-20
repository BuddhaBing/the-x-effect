feature 'marking a task as complete' do
  before do
    sign_up
    new_task
    click_link 'Meditate'
  end
  it 'user can mark a task as complete for a particular date' do
    click_link "day-1-complete"
    active_date = Task.first.active_dates.first
    expect(page).to have_content("Awesome! Keep it up!")
    expect(active_date.completed).to be true
  end
  it 'user can mark a task as missed for a particular date' do
    click_link "day-1-missed"
    active_date = Task.first.active_dates.first
    expect(page).to have_content("Aw shucks!")
    expect(active_date.completed).to be false
  end
end
