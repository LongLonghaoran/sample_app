class User < ActiveRecord::Base
  has_many :microposts
  has_many :relationships,foreign_key: "follower_id",dependent: :destroy
  has_many :reverse_relationships,foreign_key: "followed_id",
                                  dependent: :destroy,
                                  class_name: "Relationship"
  has_many :followed_users,through: :relationships,source: :followed
  has_many :followers,through: :reverse_relationships
  serialize :auth_hash, Hash
  # has_many :followeds,through: :relationships
  #利用回调函数在对象存进数据库之前转为小写
  # before_save {self.email = self.email.downcase}
  before_create :create_remember_token
  #presence验证存在性，length: {maximum: }验证最大长度
  validates :name,  presence: true, length: {maximum: 50}
  #format: {with: regex}验证数据格式,unique唯一性校验
  # validates :email,  presence: true,
  # format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i}, uniqueness: {case_sensitive: false}

  #添加了密码验证，给User模型添加了password和password_confirmation两个虚拟属性，用户的密码确认
  #比如页面需要两次密码，在模型确认两次密码是否一致
  # has_secure_password
  # validates :password, length: { minimum: 6 }
  def following？(other_user)
    relationships.find_by(followed_id: other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy!
  end

  def feed
    # This is preliminary. See "Following users" for the full implementation.
    # Micropost.where("user_id = ?", id)
    Micropost.from_users_followed_by self
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.find_or_create_from_auth_hash!(auth)
    user = User.new()
    user.auth_hash = auth
    user.name = auth.extra.name
    user.save!
    user
  end

  private
  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end
end
