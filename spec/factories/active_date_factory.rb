FactoryGirl.define do

  start_date = Date.today - 1

  sequence :task_date do |n|
    start_date + n
  end

  factory :active_date do
    task_date
    task
  end

end
