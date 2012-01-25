namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Rick Kehret",
                         :email => "rick.kehret@gmail.com",
                        :password => "yomama",
                        :password_confirmation => "yomama")
    admin.toggle!(:admin)
    
    40.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@gmail.com"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
    
    40.times do 
      User.all(:limit => 6).each do |user|
        user.inspirations.create!(:body => Faker::Lorem.sentence(5), :author => 'God')
      end
    end
    
  end
end