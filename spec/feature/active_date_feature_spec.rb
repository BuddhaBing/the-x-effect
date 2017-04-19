feature 'marking a task as complete' do
  before do
    sign_up
    new_task
    click_link 'Meditate'
  end
  it 'user can mark a task as complete for a particular date' do
    click_link "day-1-complete"
    expect(page).to have_content("Awesome! Keep it up!")
  end
  it 'user can mark a task as missed for a particular date' do
    click_link "day-1-missed"
    expect(page).to have_content("Aw! :(")
  end
end
