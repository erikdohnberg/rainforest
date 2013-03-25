class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents, :price_in_dollars
  
  validates :description, :name, :presence => true
  validates :price_in_cents, :numericality => {:only_integer => true}

  def price_in_dollars  #setter
  	price_in_dollars = price_in_cents.to_f / 100
  	# Below is now completed by "number_to_currency" application method
  	# sprintf("%.2f", price_in_dollars) #lookup sprintf documentation to see what else it can do
  end

  def price_in_dollars=(amount)  #setter
  	# Example amount #=> 6.42
  	self.price_in_cents = (amount.to_f * 100).to_i
  end

end
