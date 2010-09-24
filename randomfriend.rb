require 'twitter'
require 'pp'

# consumer key, consumer secret
oauth = Twitter::OAuth.new('wK4SHcQXL3EhCtihararow', 'f91TDJV1Gn0Emr7OYMNZ0ASPjQ3nrNiM4SlPuVm5Uk')

request_token = oauth.request_token.token
request_secret= oauth.request_token.secret

puts "Please visit this address to authorize me:"
puts oauth.request_token.authorize_url

puts "Please enter the PIN twitter gave you:"
print "> "
pin = gets.chomp

oauth.authorize_from_request(request_token, request_secret, pin)

twitter = Twitter::Base.new oauth

puts "This is you:"
current_user = twitter.verify_credentials
pp current_user

puts
puts "This is your friend:"
friends = twitter.friends
random_friend = friends[rand(friends.length)]
pp random_friend


post = "My friend @#{random_friend['screen_name']} is pretty cool! Thanks randomfriend.rb!"

puts
puts post
puts "Tweet about them? (Y/N)"
print "> "
yn = gets.chomp
if yn =~ /^y/i
  twitter.update post
end
