class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks

  validates_presence_of :username
  validates_uniqueness_of :username, :email
  validates_length_of :username, maximum: 30

end
