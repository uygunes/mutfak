class Birim < ApplicationRecord
	 default_scope { order(isim: :asc) }
	has_many :malzemes
end
