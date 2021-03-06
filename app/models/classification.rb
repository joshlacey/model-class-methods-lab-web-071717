class Classification < ActiveRecord::Base
  has_many :boat_classifications
  has_many :boats, through: :boat_classifications

  def self.my_all
    self.all
  end

  def self.longest
    Boat.all.order("boats.length").reverse_order.limit(1)[0].classifications
  end
end
