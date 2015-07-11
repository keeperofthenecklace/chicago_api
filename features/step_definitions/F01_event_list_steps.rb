Given(/^the system knows about the following events:$/) do |events|
  EventApp.data = events.hashes
end

When(/^the client request GET \/v(\d+)\/events$/) do |path|
  get(path)
end

Then(/^the response should be JSON:$/) do |json|
  JSON.parse(last_response.body).should == JSON.parse(json)
end
