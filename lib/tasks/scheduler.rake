# desc "Start task"
# task :start => :environment do
#   puts "Starting task"
# end
#
# desc "This task is called by the Heroku scheduler add-on"
# task :update_feed => :environment do
#   puts "Updating feed..."
#   NewsFeed.update
#   puts "done."
# end
#
# task :send_reminders => :environment do
#   User.send_reminders
# end
#
# desc 'Send current water consumption and pace notification'
# task :notify => :environment do
#     @urlstring = "https://api.sendpulse.com/oauth/access_token"
#     @auth = HTTParty.post(@urlstring.to_str,
#     :body => { :grant_type => 'client_credentials',
#                :client_id => Rails.application.secrets.sendpulse_api_key,
#                :client_secret => Rails.application.secrets.sendpulse_api_secret
#              }.to_json,
#     :headers => { 'Content-Type' => 'application/json' } )
#
#
#     @urlstring_to_post = "https://api.sendpulse.com/push/tasks"
#
#     @result = HTTParty.post(@urlstring_to_post.to_str,
#     :body => { :title => 'Test Notification from Quench2o',
#                :website_id => '13934',
#                :body => 'You are on pace to finish',
#                :ttl => '6',
#                :access_token => @auth['access_token']
#              }.to_json,
#     :headers => { 'Content-Type' => 'application/json' } )
#
#     puts "shouldve run"
# end
#
# desc "End of task"
# task :end => :environment do
#   puts "End task"
# end
