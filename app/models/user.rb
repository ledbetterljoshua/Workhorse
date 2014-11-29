class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :beers
   has_many :foods
   has_many :drinks
   has_many :addresses
   has_many :emails
   has_many :images
   has_many :menus
   has_many :phones
   has_many :reviews
   has_many :employees


end
