# frozen_string_literal: true

# documentation for add method https://osherove.com/tdd-kata-1/
class StringCalculator
  DEFAULT_DELIMITER = ','
  NEXT_LINE = '\n'
  STAR = '*'

  def add(numbers)
    return 0 if numbers.empty?

    delimiters, numbers = extract_delimiter(numbers)
    delimiter_contains_star = false

    delimiters.each do |delimiter|
      delimiter_contains_star = true if delimiter.include?(STAR)

      numbers = numbers.gsub(delimiter, DEFAULT_DELIMITER)
    end
    numbers_array = numbers.split(DEFAULT_DELIMITER)

    ignore_characters(numbers_array)
    numbers_array.map!(&:to_i)

    raise_negatives_exception(numbers_array)
    ignore_big_numbers(numbers_array)

    return numbers_array.sum unless delimiter_contains_star

    numbers_array.reduce(1, :*)
  end

  private

  def extract_delimiter(numbers)
    delimiters = [NEXT_LINE]

    return [delimiters, numbers] unless numbers.start_with?('//')

    delimiter_line, numbers = numbers.split('\n', 2)
    current_delimiter = ''

    delimiter_line[3..-1].each_char do |char|
      if char == '['
        current_delimiter = ''
      elsif char == ']'
        delimiters << current_delimiter
        current_delimiter = ''
      else
        current_delimiter += char
      end
    end

    delimiters.reject!(&:empty?)

    [delimiters, numbers]
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

  def ignore_big_numbers(numbers_array)
    numbers_array.reject! { |num| num > 1000 }
  end

  def ignore_characters(numbers_array)
    numbers_array.reject! { |char| char.ord >= 97 && char.ord <= 122 }
  end
end
