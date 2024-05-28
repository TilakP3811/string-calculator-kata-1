# frozen_string_literal: true

require 'rspec'
require_relative '../calculator'

RSpec.describe StringCalculator do
  subject { StringCalculator.new.add(numbers) }

  let(:numbers) { '' }

  describe '#add' do
    context 'when number is empty' do
      it { is_expected.to eq 0 }
    end

    context 'when number has single number' do
      let(:numbers) { '1' }

      it { is_expected.to eq 1 }
    end

    context 'when number has two numbers' do
      let(:numbers) { '1,2' }

      it { is_expected.to eq 3 }
    end
  end
end
