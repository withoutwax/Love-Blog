class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  # before_save { |user| user.username = user.username.downcase }
  #
  # validates_presence_of :username
  # validates_uniqueness_of :username, case_sensitive: false
  # validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
end
