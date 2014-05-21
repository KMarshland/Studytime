task :kai_is_admin => :environment do
  kai = User.find_by email: 'kaimarshland@gmail.com'
  puts kai.is_admin
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