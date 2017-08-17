class Animal < ActiveRecord::Base
  attr_accessible :breed, :price, :species, :status
  #filter try
  #scope :species, -> (species) { where species: species }
  #scope :breed, -> (breed) { where breed: breed }
  #scope :status, -> (status) { where status: status }
  #scope :price, -> (price) { where price: price }

end
