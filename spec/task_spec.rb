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
  context '#days_complete' do
    it 'returns the total number of days marked as complete' do
      FactoryGirl.create(:user, username: "Rob Brentnall", email: "test@test.com", password: "123456", password_confirmation: "123456")
      FactoryGirl.create_list(:task, 1, user: User.first)
      FactoryGirl.create_list(:active_date, 365, task: Task.first)
      expect(subject.days_complete).to eq 0
    end
  end
end
