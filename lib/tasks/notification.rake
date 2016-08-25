namespace :notification do
  desc 'Send current water consumption and pace notification'
  task :notify => :environment do
    @urlstring = "https://api.sendpulse.com/oauth/access_token"
    @auth = HTTParty.post(@urlstring.to_str,
    :body => { :grant_type => 'client_credentials',
               :client_id => Rails.application.secrets.sendpulse_api_key,
               :client_secret => Rails.application.secrets.sendpulse_api_secret
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )


    @urlstring_to_post = "https://api.sendpulse.com/push/tasks"

    @result = HTTParty.post(@urlstring_to_post.to_str,
    :body => { :title => 'Test Notification from Quench2o',
               :website_id => '13934',
               :body => 'You are on pace to finish',
               :ttl => '6',
               :access_token => @auth['access_token']
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )
  end
end
