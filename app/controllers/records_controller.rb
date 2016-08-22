class RecordsController < ApplicationController
  def submit_reading
    p params
    reading = params[:reading]
    email = params[:email]
    user = User.find_by :email => email
    record = Record.new
    record.outcome = reading
    record.user_id = user.id
    record.save
    head :ok, content_type: "text/html"
  end

  def new

  end
end
