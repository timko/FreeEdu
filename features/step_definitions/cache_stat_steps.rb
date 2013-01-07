Given /the database is updated/ do
  CacheStatistic.create_from_file('app/assets/server_traffic.log', 1)
end

When /I (un)?check the following stats: "(.*)"/ do |uncheck, stat_list|
  selected = stat_list.split(',')
  no_check = uncheck == 'un' ? 'un' : ''
  selected.each do |stat|
    step "I #{no_check}check \"stats_#{stat.strip}\""
  end
end

Then /the following checkboxes should (not )?be checked: "(.*)"/ do |uncheck, stat_list|
  selected = stat_list.split(',')
  selected.each do |stat|
    step "the \"stats_#{stat.strip}\" checkbox should #{uncheck}be checked"
  end
end
