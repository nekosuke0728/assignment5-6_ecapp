class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :cart
  has_many :orders

  enum gender: { male: 0, female: 1, lgbt: 2, other: 3 }

  validates :email, presence: true
  validates :password, presence: true
  validates :nickname, presence: true

end
