Then %r{^I should see "([^"]*)" inside ([^"].*)$} do |expected_text, named_element|
  page.should have_selector named_element
end