class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


   validates_presence_of :fullname
   
   has_many :accounts, dependent: :destroy
   has_many :donations, dependent: :destroy
   has_many :withdrawals, dependent: :destroy
end
