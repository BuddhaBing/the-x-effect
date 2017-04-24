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
end
