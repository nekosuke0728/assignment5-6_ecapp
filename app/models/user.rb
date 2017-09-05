class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :cart
  has_one :user_info, dependent: :destroy
  has_many :orders

  enum gender: { male: 0, female: 1, lgbt: 2, other: 3 }

end
