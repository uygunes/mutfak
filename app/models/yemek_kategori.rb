class YemekKategori < ApplicationRecord
	has_many :yemeks, :dependent => :restrict_with_error
end
