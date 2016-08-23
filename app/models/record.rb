class Record < ActiveRecord::Base
  belongs_to :user

  def self.by_day
    order("date_trunc('day', created_at) DESC, outcome DESC").pluck("date_trunc('day', created_at)", :outcome)
  end


  def self.today_outcome_array
    where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:outcome)
  end

  def self.today_change_array
    where("created_at >= ?", Time.zone.now.beginning_of_day).pluck(:created_at, :outcome)
  end

  def user_all_records
    @records = @current_user.by_day
    results = {};
    @records.each do |date, outcome|
      results[date] ||= []
      results[date] << outcome
    end
    return results
  end

  def user_today


  end

  def split_arrays

  end
end
