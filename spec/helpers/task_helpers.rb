def new_task(name = "Meditate", description = "For at least 10 mins", start_date = "03/04/2017", end_date = "03/05/2017",
             mon = true, tues = true, weds = true, thurs = true,
             fri = true, sat = true, sun = true)
  click_link "New Task"
  fill_in "Name", with: name
  fill_in "Description", with: description
  fill_in "Start date", with: start_date
  fill_in "End date", with: end_date
  check_or_uncheck(mon, 'task_monday')
  check_or_uncheck(tues, 'task_tuesday')
  check_or_uncheck(weds, 'task_wednesday')
  check_or_uncheck(thurs, 'task_thursday')
  check_or_uncheck(fri, 'task_friday')
  check_or_uncheck(sat, 'task_saturday')
  check_or_uncheck(sun, 'task_sunday')
  click_button "Save"
end

def check_or_uncheck(day, check_box_name)
  if day
    check check_box_name
  else
    uncheck check_box_name
  end
end
