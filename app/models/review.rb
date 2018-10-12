class Review < ActiveRecord::Base

  belongs_to :user

  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, numericality: {only_integer: true, less_than: 6, greater_than: 0}

end
