require "option_parser"


puts "Please enter your variable values assuming the form ax**2 + bx + c ."

puts "a: "
a = gets
exit if a.nil? # Ctrl+D
a = a.to_i #undefined method 'to_i' for Nil (compile-time type is (String | Nil))

puts "b: "
b = gets
exit if b.nil? # Ctrl+D
b = b.to_i

puts "c: "
c = gets
exit if c.nil? # Ctrl+D
c = c.to_i

the_gcd = a.gcd(b).gcd(a.gcd(c))

if the_gcd != 1

  if b % 1 == 0 && b > 0 && a % 1 == 0 && a > 0 && c % 1 == 0 && c > 0
    asq = a ** (1/2)
    csq = c ** (1/2)
    p! csq, asq, b
    if csq % 1 == 0 && asq % 1 == 0 &&  b == 2*asq*csq
      puts "Perfect square trinomials. I'm not going to use the quadratic formula for this one."
      csq = csq.to_i
      asq = asq.to_i
      puts "#{the_gcd}(#{asq}x + #{csq})^2"
      exit
     end
    
  elsif b % 1 == 0 && b < 0 && a % 1 == 0 && a > 0 && c % 1 == 0 && c > 0
    csq = c ** (1/2)
    asq = a ** (1/2)
    if csq % 1 == 0 && asq % 1 == 0 &&  b == -2*asq*csq
      puts "Perfect square trinomials. I'm not going to use the quadratic formula for this one."
      csq = csq.to_i
      asq = asq.to_i
      puts "#{the_gcd}(#{asq}x - #{csq})^2"
      exit
     end
   end 
   
  if b == 0 && a > 0 && c < 0
    csq = (-c) ** (1/2)
    asq = a ** (1/2)
    if csq % 1 == 0 && asq % 1 == 0
      puts "Difference of perfect squares. I'm not going to use the quadratic formula for this one."
      csq = csq.to_i
      asq = asq.to_i
      puts "#{the_gcd}(#{asq}x - #{csq})(#{asq}x + #{csq})"
      exit
     end
  elsif b == 0 && a < 0 && c > 0
    csq = c ** (1/2)
    asq = (-a) ** (1/2)
    if csq % 1 == 0 && asq % 1 == 0
      puts "Difference of perfect squares. I'm not going to use the quadratic formula for this one."
      csq = csq.to_i
      asq = asq.to_i
      puts "#{the_gcd}(#{csq} - #{asq}x)(#{csq} + #{asq}x)"
      exit
     end
   end

  x1 = (-1*b + (b**2 - 4*a*c) ** 0.5)/(2 * a)
  x2 = (-1*b - (b**2 - 4*a*c) ** 0.5)/(2 * a)

  if x1.to_i - x1 != 0 || x2.to_i - x2 != 0
    puts "The root is not a whole number. Consider grouping for factoring the polynomial."
    if x1 < 0 && x2 < 0
      puts "#{the_gcd}(x +#{-x1})(x +#{-x2})"
    elsif x1 < 0 && x2 > 0
      puts "#{the_gcd}(x +#{-x1})(x #{-x2})"
    elsif x1 > 0 && x2 < 0
      puts "#{the_gcd}(x #{-x1})(x +#{-x2})"
    elsif x1 > 0 && x2 > 0
      puts "#{the_gcd}(x #{-x1})(x #{-x2})"
    end    
    puts x1
    puts x2
    exit
  
  else
    if x1 < 0 && x2 < 0
      puts "#{the_gcd}(x +#{-x1.to_i})(x +#{-x2.to_i})"
      exit
    elsif x1 < 0 && x2 > 0
      puts "#{the_gcd}(x +#{-x1.to_i})(x #{-x2.to_i})"
      exit
    elsif x1 > 0 && x2 < 0
      puts "#{the_gcd}(x #{-x1.to_i})(x +#{-x2.to_i})"
      exit
    elsif x1 > 0 && x2 > 0
      puts "#{the_gcd}(x #{-x1.to_i})(x #{-x2.to_i})"
      exit
    end    
  end
   
  
  
  if (b**2 - 4*a*c) < 0
    puts "No real solution. Imaginary numbers involved in the solution."
    exit
  end

end

#The part below does not utilize GCD

if b % 1 == 0 && b > 0 && a % 1 == 0 && a > 0 && c % 1 == 0 && c > 0
 csq = c ** (1/2)
 asq = a ** (1/2)
 if csq % 1 == 0 && asq % 1 == 0 &&  b == 2*asq*csq
  puts "Perfect square trinomials. I'm not going to use the quadratic formula for this one."
  csq = csq.to_i
  asq = asq.to_i
  puts "(#{asq}x + #{csq})^2"
  exit
 end
end

if b % 1 == 0 && b < 0 && a % 1 == 0 && a > 0 && c % 1 == 0 && c > 0
 csq = c ** (1/2)
 asq = a ** (1/2)
 if csq % 1 == 0 && asq % 1 == 0 &&  b == -2*asq*csq
  puts "Perfect square trinomials. I'm not going to use the quadratic formula for this one."
  csq = csq.to_i
  asq = asq.to_i
  puts "(#{asq}x - #{csq})^2"
  exit
 end
end

if b == 0 && a > 0 && c < 0
 csq = (-c) ** (1/2)
 asq = a ** (1/2)
 if csq % 1 == 0 && asq % 1 == 0
  puts "Difference of perfect squares. I'm not going to use the quadratic formula for this one."
  csq = csq.to_i
  asq = asq.to_i
  puts "(#{asq}x - #{csq})(#{asq}x + #{csq})"
  exit
 end
end

if b == 0 && a < 0 && c > 0
 csq = c ** (1/2)
 asq = (-a) ** (1/2)
 if csq % 1 == 0 && asq % 1 == 0
  puts "Difference of perfect squares. I'm not going to use the quadratic formula for this one."
  csq = csq.to_i
  asq = asq.to_i
  puts "(#{csq} - #{asq}x)(#{csq} + #{asq}x)"
  exit
 end
end

x1 = (-1*b + (b**2 - 4*a*c) ** 0.5)/(2 * a)
x2 = (-1*b - (b**2 - 4*a*c) ** 0.5)/(2 * a)

if x1.to_i - x1 != 0 || x2.to_i - x2 != 0 
  puts "The root is not a whole number. Consider grouping for factoring the polynomial."
  if x1 < 0 && x2 < 0
    puts "(x +#{-x1})(x +#{-x2})"
  elsif x1 < 0 && x2 > 0
    puts "(x +#{-x1})(x #{-x2})"
  elsif x1 > 0 && x2 < 0
    puts "(x #{-x1})(x +#{-x2})"
  elsif x1 > 0 && x2 > 0
    puts "(x #{-x1})(x #{-x2})"
  end    
  puts x1
  puts x2
  exit

else
  if x1 < 0 && x2 < 0
    puts "(x +#{-x1.to_i})(x +#{-x2.to_i})"
  elsif x1 < 0 && x2 > 0
    puts "(x +#{-x1.to_i})(x #{-x2.to_i})"
  elsif x1 > 0 && x2 < 0
    puts "(x #{-x1.to_i})(x +#{-x2.to_i})"
  elsif x1 > 0 && x2 > 0
    puts "(x #{-x1.to_i})(x #{-x2.to_i})"
  end    
end
   
if (b**2 - 4*a*c) < 0
    puts "No real solution. Imaginary numbers involved in the solution."
    exit
  end


#Examples to test:

#Perfect square trinomials:
#4x²+ 12x + 9 = (2x + 3)^2
#4x²- 12x + 9 = (2x - 3)^2

#Difference of perfect squares.

#9 - 4x^2 = (3x - 2)(3x + 2)
#18 - 8x^2 = 2(3x - 2)(3x + 2)

#x**2 + 4x - 21 = (x -3)(x +7)

#The root is not a whole number:
#-7x^2 +7x +9 = 
#-14x^2 +14x +18 = 2(x +0.7392393980641051)(x -1.7392393980641052)
#-3x**2 + 12x + 1

#No real solution. Imaginary numbers involved in the solution:
#3x**2 + 6x + 10



#2x -9x -5 = (2x + 1)(x - 5)

#x² +3x +2 = (x + 1)(x + 2)

#3x^2 +12x -36 = 3(x -2)(x +6) but it gives the result (x -2)(x +6). Make sure to correct for this so that the GCD is inluded in the result
#https://crystal-lang.org/api/0.20.3/String.html#to_i
#https://stackoverflow.com/questions/51320394/how-can-i-convert-a-string-to-an-integer-or-float-in-crystal/51320395#51320395
#https://crystal-lang.org/reference/tutorials/basics/50_control_flow.html
#https://www.youtube.com/watch?v=i7idZfS8t8w
#https://stackoverflow.com/questions/2304052/check-if-a-number-has-a-decimal-place-is-a-whole-number#:~:text=a%20more%20advanced%20example%20would%20be.&text=You%20can%20multiply%20it%20by,number%20is%20a%20whole%20number.
#https://www.khanacademy.org/math/algebra/x2f8bb11595b61c86:quadratic-functions-equations/x2f8bb11595b61c86:quadratic-formula-a1/a/quadratic-formula-explained-article
#https://crystal-lang.org/api/0.34.0/Int.html#gcd(other:self):self-instance-method
#Issues

