class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :carts
  has_many :user_addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :trackable
end
