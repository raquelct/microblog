class Following < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: "User"

  validates :user_id, presence: true, uniqueness: {scope: [:user_id, :follower_id]}
  validates :follower_id, presence: true, uniqueness: {scope: [:user_id, :follower_id]}
end
