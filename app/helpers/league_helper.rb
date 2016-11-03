module LeagueHelper
  def schedule(teams)
    days = []
    teams << nil if teams.size % 2 != 0
    teams.size.times do
      day = []
      # When there are an odd number of items
      # we add one so the size is guaranteed to
      # be divisible by 2 by the definition of
      # even numbers.
      (teams.size / 2).times do |i|
        day << [teams[i], teams[-(i+1)]]
      end
      days << day
      tmp = teams[0]
      teams[0] = teams[-2]
      teams[-2] = tmp
    end
    return days
  end
end
