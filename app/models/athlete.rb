class Athlete < ActiveRecord::Base
  has_many :results
  
    def find_by_names(nomes)
      p nomes
      p Athlete.find(:all, :conditions => { :name => nomes })
    end
end
