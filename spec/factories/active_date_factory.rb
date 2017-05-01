FactoryGirl.define do

  start_date = Date.today - 1
  years = 0

  sequence :task_date do |n|
    years += 1 if n % 365 == 0
    n -= (365 * years) if years >= 1
    start_date + n
  end

  factory :active_date do
    task_date
    task
  end

end
