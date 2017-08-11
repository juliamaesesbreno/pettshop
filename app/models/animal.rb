class Animal < ActiveRecord::Base
  attr_accessible :breed, :price, :species, :status
end
