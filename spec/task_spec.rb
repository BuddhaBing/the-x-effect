describe Task do
  subject { described_class.new }
  context '#active' do
    it 'returns true if the task end date is after today' do
      expect(subject.active).to eq(true)
    end
  end
end
