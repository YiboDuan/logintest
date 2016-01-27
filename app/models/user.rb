class User < ActiveRecord::Base
  has_secure_password
  has_many :rules, dependent: :destroy
end
