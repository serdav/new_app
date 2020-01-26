class User < ApplicationRecord
has_many :articles
before_save { self.email = email.downcase }
validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { maximun: 25 }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, uniqueness: true, length: { maximun: 50 }, format: VALID_EMAIL_REGEX
end