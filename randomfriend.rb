require 'twitter'

# consumer key, consumer secret
oauth = Twitter::OAuth.new('wK4SHcQXL3EhCtihararow', 'f91TDJV1Gn0Emr7OYMNZ0ASPjQ3nrNiM4SlPuVm5Uk')

request_token = oauth.request_token.token
request_secret= oauth.request_token.secret

puts "Please visit this address to authorize me:"
puts oauth.request_token.authorize_url
