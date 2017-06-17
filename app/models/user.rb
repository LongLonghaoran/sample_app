class User < ActiveRecord::Base
  #presence验证存在性，length: {maximum: }验证最大长度
  validates :name,  presence: true, length: {maximum: 50}
  #format: {with: regex}验证数据格式,unique唯一性校验
  validates :email,  presence: true,
  format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},uniqueness: true
end
