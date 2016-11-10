class Team < ApplicationRecord
  validates :name, presence: true
  after_initialize :init
  
  def init
    Team.score ||= 0
  end
end
