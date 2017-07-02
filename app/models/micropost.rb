class Micropost < ActiveRecord::Base
  belongs_to :user,dependent: :destroy
  default_scope -> {order('created_at desc')}
  validates :content,presence: true,length: {maximum: 140}
  validates :user_id, presence: true

  def self.from_users_followed_by(user)
    # followed_user_ids = user.followed_user_ids
    #在本类中调用实例的实例方法，可以省略self.
    # where("user_id in (?) or user_id = ?",followed_user_ids,user)
    followed_user_ids = "select followed_id from relationships where
                          follower_id = :user_id"
    where("user_id in (#{followed_user_ids}) or user_id = :user_id",user_id: user.id)                    
  end
end
