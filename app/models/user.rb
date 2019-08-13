class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        # before_action :authenticate_user!
        has_many :pubs
        has_many :answers

        has_many :memberships
        has_many :groups, through: :memberships

end
