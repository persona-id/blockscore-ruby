require 'faker'

RSpec.describe BlockScore::Base, vcr: true do
  describe '#save' do
    context 'when creating a new candidate' do
      subject(:candidate) { build(:candidate) }
      before { candidate.save }

      it { is_expected.to be_persisted }
      its(:name_first) { is_expected.not_to be_empty }
    end

    context 'when updating an existing candidate' do
      subject(:candidate) { create(:candidate, name_first: 'John') }
      before do
        candidate.name_first = 'Jane'
        expect(candidate.save).to be true
      end

      it { is_expected.to be_persisted }
      its(:name_first) { is_expected.to eql 'Jane' }
    end

    context 'when encountering a deleted item' do
      subject(:candidate) { create(:candidate, name_first: 'John') }

      it 'raises and error when previously deleted' do
        candidate.delete
        expect(candidate.save).to be false
      end
    end
  end

  describe '#save!' do
    subject(:candidate) { create(:candidate, name_first: 'John') }
    context 'when updating an existing candidate' do
      it 'successfully saves an alteration' do
        candidate.name_first = 'Jane'

        expect { candidate.save! } .not_to change(candidate, :id)
        expect(candidate.persisted?).to be true
        expect(candidate.name_first).to eql 'Jane'
      end
    end

    context 'when encountering a deleted item' do
      it 'raises an error when previously deleted' do
        candidate.delete
        expect { candidate.save! }
          .to raise_error(BlockScore::Error, 'candidate is already deleted')
      end
    end
  end

  describe '#id' do
    subject(:candidate) { create(:candidate, name_last: 'Smith') }

    its(:id) { is_expected.to be_an_instance_of String }
  end

  describe '#wrap_hash' do
    subject(:person) { create(:person, name_last: 'Smith') }
    let(:expectation) do
      OpenStruct.new(address: 'no_match',
                     address_risk: 'low',
                     identification: 'no_match',
                     date_of_birth: 'not_found',
                     ofac: 'no_match',
                     pep: 'no_match')
    end

    its(:details) { is_expected.to eql expectation }
  end

  describe '#inspect' do
    subject(:candidate_inspection) { create(:candidate).inspect }

    it { is_expected.to be_an_instance_of String }
    it { is_expected.to start_with('#<BlockScore::Candidate:0x') }
  end
end
