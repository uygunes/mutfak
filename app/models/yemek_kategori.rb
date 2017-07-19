class YemekKategori < ApplicationRecord
	 default_scope { order(isim: :asc) }
	has_many :yemeks, :dependent => :restrict_with_error
end
