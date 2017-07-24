class Ogun < ApplicationRecord
	default_scope { order(isim: :asc) }
	has_many :menus , :dependent => :restrict_with_error


	has_many :restoran_oguns, :dependent => :restrict_with_error
	has_many :restorans, :through => :restoran_oguns, :dependent => :restrict_with_error

	has_many :mekans , :dependent => :restrict_with_error
	has_many :mekan_oguns, :dependent => :restrict_with_error

	accepts_nested_attributes_for :restoran_oguns
    accepts_nested_attributes_for :restorans

    accepts_nested_attributes_for :mekan_oguns
    accepts_nested_attributes_for :mekans

    amoeba do
    enable
  end
end
