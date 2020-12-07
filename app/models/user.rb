class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }

  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :friendships
  has_many :confirmed_friendships, -> { where confirmed: true }, class_name: "Friendship"
  has_many :friends, through: :confirmed_friendships
  has_many :pending_friendships, -> { where confirmed: nil }, class_name: "Friendship", foreign_key: "friend_id"
  has_many :pending_friends, through: :pending_friendships, source: :user
  has_many :inverted_friendships, -> { where confirmed: nil }, class_name: "Friendship", foreign_key: "user_id"
  has_many :friend_requests, through: :inverted_friendships, source: :friend

  def decline_friend(user)
    friendship = inverse_friendships.find { |frdship| frdship.user == user }
    friendship.destroy
    flash[:notice] = 'You declined the request!'
  end

  def friend?(user)
    friends.include?(user)
  end

  def friends_and_own_posts
    Post.where(user: (self.friends << self))
  end
end
