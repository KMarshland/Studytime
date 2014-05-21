namespace :administer do

  desc 'Checks if kai is an admin and lists all other admins'
  task :list_admins => :environment do
    kai = User.find_by email: 'kaimarshland@gmail.com'
    puts "Kai is admin? " << kai.is_admin?.to_s
    puts "Other admins: "
    User.all.each do |user|
      if user.is_admin?
        puts user.name << '  ' << user.email
      end
    end
  end

  desc 'Sets Kai as an admin'
  task :adminify_kai => :environment do
    kai = User.find_by email: 'kaimarshland@gmail.com'
    kai.update_attribute(:is_admin?, true)
    if kai.is_admin?
      puts "Kai is now an admin"
    else
      puts "Something went wrong"
    end
  end
end