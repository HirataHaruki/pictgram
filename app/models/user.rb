class User < ApplicationRecord
  VALIDATES_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALIDATES_PASS = /A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, format: { with: VALIDATES_EMAIL }
  validates :password, length: { in: 8..32 }, format: { with: VALIDATES_PASS }
  
  has_secure_password
  
  has_many :topics
  has_many :favorites
  has_many :favorite_topics, through: :favorites, source: 'topic'
  has_many :comments
end
