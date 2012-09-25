namespace :db do

  desc "empty the database by reloading the schema"
  task :empty do
    Rake::Task["db:schema:load"].invoke
  end

  desc "Fill database with sample data"
  task :populate => :environment do
    make_lifecycles
  end

  desc "re-populate the database with sample data"
  task :repopulate => [:empty, :populate] do
    puts "Database has been repopulated!"
  end

end

def make_lifecycles
  Lifecycle.create(name: "Waterfall", description: "Waterfall lifecycle")

  Lifecycle.create(name: "Scrum", description: "Scrum lifecycle")

  Lifecycle.create(name: "XP", description: "XP lifecycle")
end

#def make_admin
#  @user = User.create(email: "admin@admin.com",
#    password: "foobar", password_confirmation: "foobar")
#end
#
#def make_users
#  5.times do
#    user = FactoryGirl.create(:user)
#    user.save
#  end
#end
#
#def make_posts
#  users = User.all
#  4.times do
#    users.each do |user|
#      post = FactoryGirl.create(:post, user: user)
#      post.save
#    end
#  end
#end
#
#def make_favorites
#  users = User.all
#  users.each do |u|
#    Post.order("RANDOM()").limit(rand(5)).each do |p|
#      u.favorite! p
#    end
#  end
#end