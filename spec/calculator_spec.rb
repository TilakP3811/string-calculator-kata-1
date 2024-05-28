require 'rspec'
require_relative '../calculator'

RSpec.describe StringCalculator do
  subject { StringCalculator.new.add(numbers) }

  let(:numbers) { '' }

  describe '#add' do
    context 'when number is empty' do
      it { is_expected.to eq 0 }
    end
  end
end
