@students = [] # an empty array accessible to all methods

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
    when "1"
      @students = input_students
    when "2"
      show_students
    when "9"
      exit
    else
      puts "I don't know what you meant, try again please"
  end
end

def input_students
  puts "Please enter the names of the students"
  name = gets.chomp
  while !name.empty? do
    puts "What is their cohort?"
    cohort_list = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
    cohort = gets.chomp
      until cohort_list.include? cohort.to_sym
        puts "This is not a valid month, please enter a valid one"
        cohort = gets.chomp
      end
    @students << {name: name, cohort: cohort.to_sym}
    puts "Now we have #{@students.count} students"
    puts "Enter a new student name or to finish, just hit return twice"
    name = gets.chomp
  end
  @students = @students.sort_by {|student| cohort_list.index(student[:cohort])}
  @students
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
@students = interactive_menu
