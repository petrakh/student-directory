def input_students
  puts "Please enter the names of the students"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "What is their hobby?"
    hobby = gets.chomp
    puts "What is their country of birth?"
    country = gets.chomp
    students << {name: name, cohort: :november, hobby: hobby, country: country}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Enter a new student name or to finish, just hit return twice"
    name = gets.chomp
  end
  students
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print(students)
  n = 0
  until n == students.count
  puts "#{students[n][:name]} (#{students[n][:cohort]} cohort, hobby: #{students[n][:hobby]}, country of origin: #{students[n][:country]})".center(100)
  n += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(100)
end
students = input_students

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)
