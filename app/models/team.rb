class Team < ApplicationRecord
  validates :name, presence: true
  after_initialize :init
  
  def init
    self.score ||= 0
  end
end
