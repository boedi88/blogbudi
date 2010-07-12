Given /^a user with the login "([^"]*)" exists$/ do |login|
  user = User.create do |u|
    u.password = u.password_confirmation = "simpson312"
    u.login = login
    u.email = "homersimpson@test.com"
  end
  user.save
end

Given /^I am logged in as a user$/ do
 

  @user = User.create!(:login => "max", :password => "123456", :password_confirmation => "123456", :email => "max@max.com")
  visit path_to("the homepage")
  fill_in("Login", :with => "max")
  fill_in("Password", :with => "123456")
  click_button('Submit')
end

Given /^I have a post titled (.+)$/ do |titles|
  #Post.create!(:title => titles, :photo => "test.jpg")
   @user = User.create!(:login => "max", :password => "123456", :password_confirmation => "123456", :email => "max@max.com")
  visit path_to("the homepage")
  fill_in("Login", :with => "max")
  fill_in("Password", :with => "123456")
  click_button('Submit')
  
  post = Post.create do |u|
    u.id = "17"
    u.title = titles
    u.scontent = "testing"
    u.name = "dwi"
    u.photo_file_name = "test.jpg"
    u.photo_content_type = 'image/jpeg'
    u.photo_file_size = 1.megabytes
    u.user = @user
  end

  post.save
end
