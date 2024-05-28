# frozen_string_literal: true

# documentation for add method https://osherove.com/tdd-kata-1/
class StringCalculator
  DEFAULT_DELIMITER = ','

  def add(numbers)
    return 0 if numbers.empty?

    delimiter, numbers = extract_delimiter(numbers)
    numbers_array = numbers.tr('\n', delimiter).split(delimiter).map(&:to_i)

    raise_negatives_exception(numbers_array)

    numbers_array.sum
  end

  private

  def extract_delimiter(numbers)
    delimiter = DEFAULT_DELIMITER

    if numbers.start_with?('//')
      delimiter_line, numbers = numbers.split('\n', 2)
      delimiter = delimiter_line[-1]
    end

    [delimiter, numbers]
  end

  def raise_negatives_exception(numbers_array)
    raise_negative_exception(numbers_array) if negatives_found?(numbers_array)
  end

  def negatives_found?(numbers_array)
    numbers_array.any?(&:negative?)
  end

  def raise_negative_exception(numbers_array)
    negatives = numbers_array.select(&:negative?)

    raise "negatives not allowed: #{negatives.join(', ')}"
  end
end
