
Given(/^the following movies exist:$/) do |table|
 table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then(/^the director of "(.*?)" should be "(.*?)"$/) do |arg1, arg2|
  if page.respond_to? :should
    page.should have_content(arg2)
  else
    assert page.has_content?(arg2)
  end
end

Then(/^I should see "(.​*?)" before "(.*​?)"$/) do |arg1, arg2|
  pending
end