require 'pry'
class RomanNumeral
  
  HASHROMAN = {
    'I'=> 1,
    'IV' => 4,
    'V'=> 5,
    'IX' => 9,
    'X'=> 10,
    'XL' => 40,
    'L'=> 50,
    'XC' => 90,
    'C'=> 100,
    'CD' => 400,
    'CM' => 900,
    'D'=> 500,
    'M'=> 1000
  }
  
  def initialize( numeral_string )
    @roman_string = numeral_string
  end
  
  # converts roman numerals to numbers
  def to_number
    arr = []
    roman_array = @roman_string.split("")
    
    until roman_array.empty?
      if arr.empty? || arr.last >= HASHROMAN[roman_array.first]
        arr << HASHROMAN[roman_array.shift]
      else
        x = HASHROMAN[roman_array.shift] - arr.pop
        arr << x
      end
    end
    
    arr.inject(0) {|sum, x| sum + x}
  end
  
# converts numbers to roman numerals
  def to_roman_numerals(number, array=[])
    return array.join if number.zero? 
    array << highest_decimal_value(number)
    array_sum = array.inject(0) {|sum, x| sum + HASHROMAN[x]}
    to_roman_numerals(number - HASHROMAN[array.last], array)
  end

# finds the highest decimal value of a number and returns the roman numeral equivalent
  def highest_decimal_value(number)
    number_of_digits = number.to_s.length
    
    if number_of_digits == 4
      return 'M'
    end
    
    if number_of_digits == 3
      if number - 900 >= 0
        return 'CM'
      elsif number - 500 >= 0 
        return 'D'
      elsif number - 400 >= 0
        return 'CD'
      else 
        return 'C'
      end
    end
    
    if number_of_digits == 2
      if number - 90 >= 0
        return 'XC'
      elsif number - 50 >= 0
        return 'L'
      elsif number - 40 >= 0
        return 'XL'
      else
        return 'X'
      end
    end
    
    if number_of_digits == 1
      if number - 9 >= 0
        return 'IX'
      elsif number - 5 >= 0
        return 'V'
      elsif number - 4 >= 0
        return 'IV'
      else
        return 'I'
      end
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

