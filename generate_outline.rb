project.each do |name, values|
  puts "### #{values[:project_name]}"
  puts ""
  puts "* Team: #{values[:members].join(', ')}"
  puts "* Code: #{values[:repo_url]}"
  puts "* Production: #{values[:production_url]}"
  puts ""
end