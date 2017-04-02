def new_task
  click_link "New Task"
  fill_in "Name", with: "Meditate"
  fill_in "Start Date", with: "03/04/2017"
  fill_in "End Date", with: "03/05/2017"
  check 'Monday'
  check 'Tuesday'
  check 'Wednesday'
  check 'Thursday'
  check 'Friday'
  check 'Saturday'
  check 'Sunday'
  click_button "Save"
end
