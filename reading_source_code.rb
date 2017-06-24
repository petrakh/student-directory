File.open($0, "r") do |read_file|
  while source_code = read_file.gets
    puts source_code
  end
end
