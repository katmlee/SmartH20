class Total < ActiveRecord::Base
  belongs_to :user
  def self.getTotalToday
    where('created_at >= ?', Time.zone.now.beginning_of_day)
  end

  def self.getTotalWeek
    where('created_at >= ?', 1.week.ago)
  end
end
