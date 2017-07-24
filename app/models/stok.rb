class Stok < ApplicationRecord
	belongs_to :malzeme
	has_many :mekan_stoks, :dependent => :restrict_with_error
	has_many :mekans, :through => :mekan_stoks, :dependent => :restrict_with_error

	accepts_nested_attributes_for :mekan_stoks
	accepts_nested_attributes_for :mekans

	def isim
		self.malzeme.isim
	end
end
