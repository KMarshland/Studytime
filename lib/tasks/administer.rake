task :greet do
  puts 'Hai'
end

task :adminify_kai => :environment do
  kai = User.find_by email: 'kaimarshland@gmail.com'
  kai.update_attribute(:is_admin, true)
  if kai.is_admin
    puts "Kai is now an admin"
  else
    puts "Something went wrong"
  end
end