require 'spec_helper'
require 'roman_numeral'
require 'pry'


describe RomanNumeral do
  
  it 'can convert roman numerals to numbers when previous number is larger' do
    number = RomanNumeral.new('XXX').to_number
    number_2 = RomanNumeral.new('LXI').to_number
    number_3 = RomanNumeral.new('VIII').to_number
    number_4 = RomanNumeral.new('XCI').to_number
    number_5 = RomanNumeral.new('MCMXCVII').to_number
    
    expect(number).to eq(30)
    expect(number_2).to eq(61)
    expect(number_3).to eq(8)
    expect(number_4).to eq(91)
    expect(number_5).to eq(1997)
  end
  
  it 'can convert roman numerals to numbers when previous number is smaller' do
    number = RomanNumeral.new('MMX').to_number
    number_2 = RomanNumeral.new('XIV').to_number
    number_3 = RomanNumeral.new('MCMXCVI').to_number
  
    expect(number).to eq(2010)
    expect(number_2).to eq(14)
    expect(number_3).to eq(1996)
  
  end
  
  it 'can convert numbers to roman numerals' do
    roman_numeral = RomanNumeral.new('')
    expect(roman_numeral.to_roman_numerals(36)).to eq('XXXVI')
    expect(roman_numeral.to_roman_numerals(2012)).to eq('MMXII')
    expect(roman_numeral.to_roman_numerals(1996)).to eq('MCMXCVI')
  end
  
  it 'should compute simple arithmatic' do
    #@reports << Benchmark.measure do
      expect( RomanNumeral.new( 'MCMXCVI' ) + RomanNumeral.new( 'XIV' ) ).to eq('MMX')
      expect( RomanNumeral.new( 'MMX' ) + RomanNumeral.new( 'XIV' ) ).to eq('MMXXIV')
    #end
  end

end
