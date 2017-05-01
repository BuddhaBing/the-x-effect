describe Task do
  subject { described_class.new }
  context '#active?' do
    it 'returns true if the task has no end date' do
      expect(subject.active?).to eq(true)
    end
    it 'returns true if the task end date is after today' do
      task = Task.new
      task.end_date = Date.parse("01/01/3017")
      expect(subject.active?).to eq(true)
    end
    it 'returns false if the task end date is before today' do
      task = Task.new
      task.end_date = Date.parse("01/01/2017")
      expect(subject.active?).to eq(true)
    end
  end
  context '#active_day?' do
    before do
      subject.start_date = Date.today
      subject.end_date = Date.parse("01/01/3017")
    end
    it 'returns true if the date is one of the chosen days of the week' do
      set_days(subject, true)
      expect(subject.active_day?(subject.start_date)).to eq true
    end
    it 'returns false if the date is not one of the chosen days of the week' do
      set_days(subject, false)
      expect(subject.active_day?(subject.start_date)).to eq false
    end
  end
  context '#days_complete, #days_missed, #days_remaining' do
    before do
      FactoryGirl.create(:user, username: "Rob Brentnall", email: "test@test.com", password: "123456", password_confirmation: "123456")
      FactoryGirl.create_list(:task, 1, user: User.first)
      FactoryGirl.create_list(:active_date, 365, task: Task.first)
      active_date = Task.first.active_dates.first
      active_date.update(completed: false)
      active_date.save!
      active_date = Task.first.active_dates.second
      active_date.update(completed: true)
      active_date.save!
      active_date = Task.first.active_dates.third
      active_date.update(completed: true)
      active_date.save!
    end
    it '#days_complete returns the total number of days marked as complete' do
      expect(Task.first.days_complete).to eq 2
    end
    it '#days_missed returns the total number of days marked as missed' do
      expect(Task.first.days_missed).to eq 1
    end
    it '#days_remaining returns the total number of days remaining' do
      expect(Task.first.days_remaining).to eq 362
    end
  end
  context '#current_streak' do
    before do
      FactoryGirl.create(:user, username: "Rob Brentnall", email: "test@test.com", password: "123456", password_confirmation: "123456")
      FactoryGirl.create_list(:task, 1, user: User.first)
      FactoryGirl.create_list(:active_date, 365, task: Task.first)
    end
    it 'should return zero if no dates have been marked missed or complete' do
      expect(Task.first.current_streak).to eq 0
    end
    it 'should return zero if the last date was marked missed' do
      active_date = Task.first.active_dates.second
      active_date.update(completed: false)
      active_date.save!
      active_date = Task.first.active_dates.first
      active_date.update(completed: true)
      active_date.save!
      expect(Task.first.current_streak).to eq 0
    end
    it 'should return 2 if the last two consecutive dates were marked completed' do
      active_date = Task.first.active_dates.second
      active_date.update(completed: true)
      active_date.save!
      active_date = Task.first.active_dates.third
      active_date.update(completed: true)
      active_date.save!
      expect(Task.first.current_streak).to eq 2
    end
  end
end
