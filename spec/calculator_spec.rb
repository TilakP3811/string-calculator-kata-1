# frozen_string_literal: true

require 'rspec'
require_relative '../calculator'

# rubocop:disable Metrics/BlockLength
RSpec.describe StringCalculator do
  subject(:add) { StringCalculator.new.add(input) }

  let(:input) { '' }

  describe '#add' do
    context 'when input is empty' do
      it { is_expected.to eq 0 }
    end

    context 'when input has single number' do
      let(:input) { '1' }

      it { is_expected.to eq 1 }
    end

    context 'when input has two numbers' do
      let(:input) { '1,2' }

      it { is_expected.to eq 3 }
    end

    context 'when input has unknown amount of numbers' do
      let(:input) { '1,2,3,4,5' }

      it { is_expected.to eq 15 }
    end

    context 'when input has next-line(\n) symbol between numbers' do
      let(:input) { '1\n2,3' }

      it { is_expected.to eq 6 }
    end

    context 'when input has delimiter changer' do
      context 'when there is no next-line(\n) symbol after delimiter changer' do
        let(:input) { '//[;]\n3;7' }

        it { is_expected.to eq 10 }
      end

      context 'when there is next-line(\n) symbol after delimiter changer' do
        let(:input) { '//[;]\n3;7\n4' }

        it { is_expected.to eq 14 }
      end
    end

    context 'when input has negative numbers' do
      let(:input) { '1,-2\n-3' }

      it 'raises an exception for negative numbers' do
        expect { add }.to raise_error(RuntimeError, 'negatives not allowed: -2, -3')
      end
    end

    context 'when input has numbers bigger than 1000' do
      let(:input) { '1,1001,2,2000,3' }

      it { is_expected.to eq 6 }
    end

    context 'when input has any length of delimiter changer' do
      let(:input) { '//[^^^]\n1^^^2^^^3' }

      it { is_expected.to eq 6 }
    end

    context 'when input has more than one custom delimiter changer' do
      let(:input) { '//[^][%]\n1^2%3\n8^2%5' }

      it { is_expected.to eq 21 }
    end

    context 'when multiple delimiter changer has length more than 1' do
      let(:input) { '//[^][%&]\n1^2%&3\n8^2%&5' }

      it { is_expected.to eq 21 }
    end

    context 'when character are present into input' do
      let(:input) { '1,a,3' }

      it { is_expected.to eq 4 }
    end

    context 'when delimiter contains start' do
      let(:input) { '//[*^]\n2*^3' }

      it { is_expected.to eq 6 }
    end
  end
end
# rubocop:enable Metrics/BlockLength
