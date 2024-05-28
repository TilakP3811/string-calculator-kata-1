# frozen_string_literal: true

# documentation for add method https://osherove.com/tdd-kata-1/
class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)

    numbers.tr('\n', delimiter).split(delimiter).map(&:to_i).sum
  end

  private

  def extract_delimiter(numbers)
    delimiter = ','

    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split('\n', 2)
      delimiter = delimiter_line[-1]
    end

    [delimiter, numbers]
  end
end
