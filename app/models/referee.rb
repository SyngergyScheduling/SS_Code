class Referee < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true
  has_secure_password
  after_initialize :init

  def init
    self.level ||= 0
  end
end
