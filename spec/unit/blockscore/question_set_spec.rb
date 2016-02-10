module BlockScore
  RSpec.describe QuestionSet do
    describe '.new' do
      subject(:question_set) { BlockScore::QuestionSet.new }

      it { is_expected.not_to be_persisted }
      its(:class) { should be BlockScore::QuestionSet }
    end

    describe '.create' do
      context 'valid person' do
        let(:person_id) { create(:valid_person).id }
        subject(:question_set) { BlockScore::QuestionSet.create(person_id: person_id) }

        it { is_expected.to be_persisted }
        its(:class) { should be BlockScore::QuestionSet }
      end

      context 'invalid person' do
        let(:person_id) { create(:invalid_person).id }

        it { expect { BlockScore::QuestionSet.create(person_id: person_id) }.to raise_error BlockScore::InvalidRequestError }
      end
    end

    describe '.retrieve' do
      let(:question_set_id) { create(:question_set).id }
      subject(:question_set) { BlockScore::QuestionSet.retrieve(question_set_id) }

      it { is_expected.to be_persisted }
      its(:questions) { is_expected.not_to be_empty }
      its(:class) { should be BlockScore::QuestionSet }
    end

    describe '#score' do
      subject(:question_set) { create(:question_set) }
      let(:correct_answers) { QuestionSetHelper.correct_answers(question_set.questions) }
      let(:incorrect_answers) { QuestionSetHelper.incorrect_answers(question_set.questions) }

      context 'correct answers' do
        it { expect(question_set.score(correct_answers)).to be 100.0 }
      end

      context 'incorrect answers' do
        it { expect(question_set.score(incorrect_answers)).to be 0.0 }
      end

      context 'malformed answers' do
        it 'raises an error when answers are not an array of hashes' do
          expect { question_set.score([]) }
            .to raise_error InvalidRequestError, \
                            '(Type: invalid_request_error) ' \
                            'Answers should be an array of objects  (Status: 400)'
        end
      end

      context 'previous answers' do
        before { question_set.score(correct_answers) }

        it { expect(question_set.score).to be 100.0 }
      end

      context 'previously no answers' do
        it { expect(question_set.score).to be nil }
      end
    end

    describe '#refresh' do
      subject(:question_set) { create(:question_set) }
      before do
        question_set.questions = nil
        question_set.refresh
      end

      its(:questions) { is_expected.not_to be_empty }
    end

    describe '#inspect' do
      subject(:question_set_inspection) { create(:question_set).inspect }

      its(:class) { should be(String) }
      it { is_expected.to match(/^#<BlockScore::QuestionSet:0x/) }
    end

    describe '#delete' do
      subject(:question_set) { create(:question_set) }
      it { expect { question_set.delete }.to raise_error NoMethodError }
    end

    describe '#save' do
      subject(:question_set) { build(:question_set) }
      before { question_set.save }

      it { is_expected.to be_persisted }
      its(:class) { should be BlockScore::QuestionSet }
    end
  end
end
