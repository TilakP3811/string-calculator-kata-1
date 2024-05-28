# frozen_string_literal: true

require 'rspec'
require_relative '../calculator'

RSpec.describe StringCalculator do
  subject { StringCalculator.new.add(input) }

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
  end
end
