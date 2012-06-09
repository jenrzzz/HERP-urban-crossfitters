# Stores trainer info.
class Trainer < ActiveRecord::Base

  # ----- ATTRIBUTES ACCESSIBLE -----
  attr_accessible :name, :description
end
