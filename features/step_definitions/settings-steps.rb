Given /^(?:|I )am logged in as "([^"]*)" with password "([^"]*)"$/ do |user, password|
  step %Q{I follow "Login"}
	step %Q{I fill in "user_name" with "#{user}"}
	step %Q{I fill in "user_password" with "#{password}"}
	step %Q{I press "Sign in"}
end

Given /^(?:|I )am not logged in as a user$/ do
	step %Q{I am on the homepage}
  step %Q{I should see "Login"}
end