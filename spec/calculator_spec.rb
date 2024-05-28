require 'rspec'
require_relative '../calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    it 'returns 0 for an empty string' do
      calculator = StringCalculator.new
      result = calculator.add('')
      expect(result).to eq(0)
    end
  end
end
