@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to a file"
  puts "4. Load the list from a file"
  puts "9. Exit"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again please"
  end
end

def input_students
  puts "Please enter the names of the students"
  name = STDIN.gets.chomp
  while !name.empty? do
    create_student_hash(name)
    puts "Done, now we have #{@students.count} students"
    puts "Enter a new student name or to finish, just hit return twice"
    name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------".center(100)
end

def print_students_list
  if @students.count >= 1
    @students.each do |student|
      puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    end
  else
    puts "There is no student, so I'm not printing a list".center(100)
  end
end

def print_footer
  if @students.count == 0
    puts "We have zero students".center(100)
  elsif @students.count < 2
    puts "Overall, we have #{@students.count} great student".center(100)
  else
    puts "Overall, we have #{@students.count} great students".center(100)
  end
end

def save_students
  puts "Which file do you want to save in?"
  filename = STDIN.gets.chomp
  # open the file for writing
  require "CSV"
  CSV.open(filename, "wb") do |f|
    @students.each do |student|
      f << [student[:name], student[:cohort]]
    end
  end
  puts "The list has been saved to #{filename}"
end

def load_students(filename = "")
  if filename == ""
    puts "Which file would you like to load?"
    filename = STDIN.gets.chomp
  end
  require "CSV"
  CSV.foreach(filename) do |a,b|
      create_student_hash(a, b)
  end
  puts "Student list loaded from #{filename}"
end

def create_student_hash(name, cohort = "november")
    @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end

try_load_students
interactive_menu



#def input_students
#  puts "Please enter the names of the students"
#  name = gets.chomp
#  while !name.empty? do
#    puts "What is their cohort?"
#    cohort_list = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
#    cohort = gets.chomp
#      until cohort_list.include? cohort.to_sym
#        puts "This is not a valid month, please enter a valid one"
#        cohort = gets.chomp
#      end
#    @students << {name: name, cohort: cohort.to_sym}
#    puts "Now we have #{@students.count} students"
#    puts "Enter a new student name or to finish, just hit return twice"
#    name = gets.chomp
#  end
#  @students = @students.sort_by {|student| cohort_list.index(student[:cohort])}
#  @students
#end
