describe Task do
  subject { described_class.new }
  context '#active' do
    it 'returns true if the task has no end date' do
      expect(subject.active).to eq(true)
    end
    it 'returns true if the task end date is after today' do
      task = Task.new
      task.end_date = Date.parse("01/01/3017")
      expect(subject.active).to eq(true)
    end
    it 'returns false if the task end date is before today' do
      task = Task.new
      task.end_date = Date.parse("01/01/2017")
      expect(subject.active).to eq(true)
    end
  end
end
