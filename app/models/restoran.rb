class Restoran < ApplicationRecord
	has_many :restoran_oguns
	has_many :oguns, :through => :restoran_oguns
	has_many :menus
    

	accepts_nested_attributes_for :restoran_oguns
    accepts_nested_attributes_for :oguns
    accepts_nested_attributes_for :menus

    def basic
		"#{self.isim}"
    end

    def sid
    	self.id
    end
end
