module LuhnValidator
  # Validates credit card number using Luhn Algorithm
  # arguments: none
  # assumes: a local String called 'number' exists
  # returns: true/false whether last digit is correct
  def validate_checksum
    nums_a = number.to_s.chars.map(&:to_i)
    nums_a = nums_a.reverse()

    x = 1
    total = 0
  
    nums_a.each do |item|
      if (x % 2 == 0) 
        temp = item * 2
        i = (temp % 10) + (temp / 10)
        total = total + i
      elsif(x % 2 == 1) && (x != 1)
        total += item
      end
      x += 1
    end
    check = total % 10
    check = 10 - check

    check = 0 if check == 10

    return true if check == nums_a[0]
      
    false
  end
end
