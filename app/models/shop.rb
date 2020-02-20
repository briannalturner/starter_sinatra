class Shop < ActiveRecord::Base
    has_many :relationships
    has_many :icecreams, through: :relationships

end