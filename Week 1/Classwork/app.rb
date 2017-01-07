# Different data types #
my_string = "Hello"
puts my_string
my_integer = 3
puts my_integer
my_float = 4.2
puts my_float
my_boolean = false
puts my_boolean

# String Concatination #
string_a = "hello"
string_b = "world"
integer_a = 4
final_string = string_a + " " + string_b
final_string2 = string_a + " " + integer_a.to_s
puts final_string
puts final_string2

# Math #
integer_1 = 34
integer_2 = 74
integer_3 = 51
float_1 = 5.7
float_2 = 91.8
float_3 = 38.6
puts "#{integer_1} + #{float_1} = #{integer_1.to_f + float_1}"
puts "#{integer_3} - #{float_3} = #{integer_3.to_f - float_3}"
puts "#{float_2} x #{float_3} = #{float_2 * float_3}"
puts "#{integer_1} / #{integer_2} = #{integer_1.to_f / integer_2.to_f}"
