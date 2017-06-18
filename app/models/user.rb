class User < ActiveRecord::Base
  #利用回调函数在对象存进数据库之前转为小写
  before_save {self.email = self.email.downcase}
  #presence验证存在性，length: {maximum: }验证最大长度
  validates :name,  presence: true, length: {maximum: 50}
  #format: {with: regex}验证数据格式,unique唯一性校验
  validates :email,  presence: true,
  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},uniqueness: true

  has_secure_password
  validates :password, length: { minimum: 6 }
end
