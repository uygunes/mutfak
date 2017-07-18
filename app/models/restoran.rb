class Restoran < ApplicationRecord
	has_many :restoran_oguns, :dependent => :restrict_with_error
	has_many :oguns, :through => :restoran_oguns, :dependent => :restrict_with_error
	has_many :menus, :dependent => :restrict_with_error
    

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
