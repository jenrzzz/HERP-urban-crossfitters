# Stores trainer info.
class Trainer < ActiveRecord::Base
  attr_accessible :name, :description
end
