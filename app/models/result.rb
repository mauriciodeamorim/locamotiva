class Result < ActiveRecord::Base
  belongs_to :race
  belongs_to :athlete

private
  def self.last_race
    race = Race.find(:last, :order => "date ASC")
    
  end
  
  def self.by_race
    self.last_race.results.find(:all, :order => "class_general ASC")
  end
end
