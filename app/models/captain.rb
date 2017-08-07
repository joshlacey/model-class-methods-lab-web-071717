class Captain < ActiveRecord::Base
  has_many :boats

  def self.catamaran_operators
    self.joins(:boats => :classifications).where("classifications.name = 'Catamaran'")
    #self.joins(:boats).joins("JOIN boat_classifications ON boats.id = boat_classifications.boat_id").joins("JOIN classifications ON classifications.id = boat_classifications.classification_id").where("classifications.name = 'Catamaran'")
  end

  def self.sailors
    self.joins(:boats => :classifications).where("classifications.name = 'Sailboat'").uniq
  end

  def self.talented_seamen
    self.joins(:boats => :classifications).where("classifications.name = 'Motorboat'").where(:id => self.sailors.pluck(:id))
  end

  def self.non_sailors
    self.where.not(id: self.sailors.pluck(:id))
  end
end
