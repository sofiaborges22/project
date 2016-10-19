class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :name, :username

  def name
  end

  def username
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

        has_many :problems
end
