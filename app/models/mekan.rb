class Mekan < ApplicationRecord
	belongs_to :mekan_kategori
	default_scope { order(isim: :asc) }

	has_many :yemeks
	has_many :mekan_oguns, :dependent => :restrict_with_error
	has_many :oguns, :through => :mekan_oguns, :dependent => :restrict_with_error
	has_many :menus, :dependent => :restrict_with_error

	accepts_nested_attributes_for :mekan_oguns
    accepts_nested_attributes_for :oguns

    scope :restoran, -> { where(:mekan_kategori_id => "1")}
    scope :mutfak, -> { where(:mekan_kategori_id => "2")}
    scope :bar, -> { where(:mekan_kategori_id => "3")}
    scope :mutfak_bar, -> {where(mekan_kategori_id: [2,3])}
    scope :bar_restoran, -> {where(mekan_kategori_id: [1,3])}
end
