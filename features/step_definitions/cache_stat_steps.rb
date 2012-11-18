Given /the database is updated/ do
  CacheStatistic.create_from_file('script/server_traffic.log', 1)
end

When /I (un)?check the following stats: "(.*)"/ do |uncheck, stat_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  selected = stat_list.split(',')
  no_check = uncheck == 'un' ? 'un' : ''
  selected.each do |stat|
    step "I #{no_check}check \"stats_#{stat.strip}\""
  end
end

Then /I should( not)? see the following stats: "(.*)"/ do |unsee, stat_list|

  selected = stat_list.split(',')
  unsee = unsee == ' not' ? ' not' : ''
  selected.each do |stat|
    step "I should#{unsee} see \"stat.strip\""

end
