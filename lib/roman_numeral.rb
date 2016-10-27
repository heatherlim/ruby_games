require 'pry'
class RomanNumeral
  
  attr_accessor :roman_string
  
  HASHROMAN = {
    'I'=> 1,
    'V'=> 5,
    'X'=> 10,
    'L'=> 50,
    'C'=> 100,
    'D'=> 500,
    'M'=> 1000
  }
  
  CONVHASH = {
    4 => {'1' => 'M', '2' => 'MM', '3' => 'MMM', '4' => 'MMMM'},
    3 => { '1' => 'C', '2' => 'CC', '3' => 'CCC', '4' => 'CD', '5' => 'D', '6' => 'DC', '7' => 'DCC', '8' => 'DCCC', '9' => 'CM'},
    2 => { '1' => 'X', '2' => 'XX', '3' => 'XXX', '4' => 'XL', '5' => 'L', '6' => 'LX', '7' => 'LXX', '8' => 'LXXX', '9' => 'XC'},
    1 => { '1' => 'I', '2' => 'II', '3' => 'III', '4' => 'IV', '5' => 'V', '6' => 'VI', '7' => 'VII', '8' => 'VIII', '9' => 'VIIII'}
  }
  
  def initialize( numeral_string )
    @roman_string = numeral_string
  end
  
  def to_number
    arr = []
    roman_array = @roman_string.split("")
    loop_size = roman_array.count
    
    for i in 0..loop_size
      until roman_array.empty?
        value_1 = roman_array.pop
        value_2 = roman_array.pop
        if value_2
          arr << roman_compare(HASHROMAN[value_1], HASHROMAN[value_2])
        else
          arr << HASHROMAN[value_1]
        end
      end
    end
    arr.inject { | sum, n | sum + n}
  end
  
  def to_roman_numerals(number)
    num_array = number.to_s.split("")
    array = []
    until num_array.empty?
      array << CONVHASH[num_array.count][num_array.first]
      num_array.shift
    end
    
    array.join
    # return array if number_length.zero? 
    # num_array = number.to_s.split("")
    # array << highest_decimal_value(num_array)
    # to_roman_numerals(number, number_length - 1, array)
  end
  
  def roman_compare(value_1, value_2)
    if value_2 < value_1
      value_1 - value_2
    else
      value_1 + value_2
    end
  end
  
  
  def +( numeral_string )
    result = self.to_number + numeral_string.to_number
    to_roman_numerals(result)
  end

  def -( numeral_string )
    result = self.to_number - numeral_string.to_number
    to_roman_numerals(result)
  end
end

