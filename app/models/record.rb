class Record < ActiveRecord::Base
  belongs_to :user

  def self.by_day
    order("date_trunc('day', created_at) DESC, outcome DESC").pluck("date_trunc('day', created_at)", :outcome)
    # Record.group_by_day()
  end


  def self.today_outcome_array
    where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:outcome)
  end

  def self.today_change_array
    where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:created_at, :outcome)
  end


end
