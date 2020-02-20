class Icecream < ActiveRecord::Base
    has_many :relationships
    has_many :shops, through: :relationships

end