# frozen_string_literal: true

# documentation for add method https://osherove.com/tdd-kata-1/
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').map(&:to_i).sum
  end
end
