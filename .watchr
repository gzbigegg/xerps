def run_spec(file)
  puts "\n\n------------------------------------------------\n" 
  unless File.exist?(file)
    puts "#{file} does not exist" 
    return
  end

  puts "Running #{file}" 
  system "bundle exec rspec #{file}" 
  puts
end

def run_cucumber(file)
  puts "\n\n=================================================\n" 
  unless File.exist?(file)
    puts "#{file} does not exist" 
    return
  end

  puts "Running #{file}" 
  system "bundle exec cucumber --drb #{file}" 
  puts

end

watch("app/(.*/.*).rb") do |match|
  run_spec %{spec/#{match[1]}_spec.rb}
end

watch("app/views/(.*).html.erb") do |match|
  file = match[0].gsub(/app\//, "")
  run_spec "spec/#{file}_spec.rb" 
end

watch("spec/.*/*_spec.rb") do |match|
  run_spec match[0]
end

watch("features/(.*).feature") do |match|
  run_cucumber( match[0])
end

watch("features/(.*/.*).feature") do |match|
  run_cucumber( match[0])
end
