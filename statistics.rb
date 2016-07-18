require 'awesome_print'
require 'descriptive_statistics'
require 'highline'
require 'terminal-table'
require 'active_support/all'

puts "------------------------------------------------------"
puts "Choose your data set sample (default set to 'weight'):"
puts "------------------------------------------------------\n
a. simple \n
b. ages \n
c. weight \n
Your choice: "
data_set = gets.chomp
case data_set
when "a"
  data = [1, 2, 4, 5, 5, 6, 2, 2, 2, 4, 3, 3, 6, 1, 3, 1, 3, 2, 5, 2, 1, 2, 3, 3, 4]
when "b"
  data = [22, 53, 29, 36, 27, 45, 25, 31, 64, 62, 23, 57, 61, 38, 45, 52, 27, 33, 65, 39]
when "c"
  data = [140, 145, 160, 190, 155, 165, 150, 190, 195, 138, 160, 155, 153, 145, 170, 175, 175, 170, 180]
else
  data = [140, 145, 160, 190, 155, 165, 150, 190, 195, 138, 160, 155, 153, 145, 170, 175, 175, 170, 180]
end
puts "\n"
puts "Your data sets: #{data}"
puts "\n"
result = data.descriptive_statistics
table = Terminal::Table.new do |t|
  result.each do |k, v|
    t << [k.upcase, v]
    t.add_separator unless v == result.to_a.last.last
  end
end

puts table
