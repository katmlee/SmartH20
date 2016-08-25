class TotalsController < ApplicationController
  def today
    render :json => {
      # :goal => @current_user.goal,
      :total => @current_user.totals.getTotalToday
    }

  end

  def historical
    render :json => {
      :totalArray => @current_user.totals.getTotalWeek
    }

  end

  def notification
    @urlstring = "https://api.sendpulse.com/oauth/access_token"
    @auth = HTTParty.post(@urlstring.to_str,
    :body => { :grant_type => 'client_credentials',
               :client_id => '9d1d9f08250db1e3a10022167117ab98',
               :client_secret => '90d958b4280d01c686183d30c4643c03'
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )


    @urlstring_to_post = "https://api.sendpulse.com/push/tasks"

    @result = HTTParty.post(@urlstring_to_post.to_str,
    :body => { :title => 'Test Notification from Quench2o',
               :website_id => '13934',
               :body => 'You are on pace to finish',
               :ttl => 6,
               :access_token => @auth['access_token']
             }.to_json,
    :headers => { 'Content-Type' => 'application/json' } )
  end
end
