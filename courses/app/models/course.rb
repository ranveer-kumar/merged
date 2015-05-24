class Course < ActiveRecord::Base
  has_many :lessons
  has_many :coursephotos
  has_many :questions
  has_many :courseprivacies
  has_many :priceandcoupons
  has_many :manageinstructors
  has_many :coursefeedbacks
end
