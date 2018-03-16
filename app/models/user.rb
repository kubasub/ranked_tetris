class User < ApplicationRecord
  has_many :won_matches, class_name: "Match", foreign_key: "winner_id"

  def matches
    Match.where("player_one_id = ? OR player_two_id = ?", self.id, self.id)
  end

  def wins
    self.won_matches.count
  end

  def losses
    self.matches.count - self.wins
  end
end
