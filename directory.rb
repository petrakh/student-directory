def input_students
  puts "Please enter the names of the students"
  students = []
  name = gets
  name.gsub!("\n","")
  while !name.empty? do
    puts "What is their cohort?"
    cohort_list = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    cohort = gets.chomp
      unless cohort_list.include? cohort.to_sym
        puts "This is not a valid month, please enter a valid one"
        cohort = gets.chomp
      end
    students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{students.count} students"
    puts "Enter a new student name or to finish, just hit return twice"
    name = gets
    name.gsub!("\n","")
  end
  students = students.sort_by {|student| cohort_list.index(student[:cohort])}
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  students.each do |student|
  puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
  end
end

def print_footer(students)
  puts students.count < 2 ? "Overall, we have #{students.count} great student".center(100) : "Overall, we have #{students.count} great students".center(100)
end
students = input_students


print_header
print(students)
print_footer(students)
