class Contestant < ActiveRecord::Base
  
  validates_uniqueness_of :name
  
  def self.random
    unless count.zero?
      first :offset => rand(count)
    end
  end
  
end
