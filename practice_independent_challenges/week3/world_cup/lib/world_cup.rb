class WorldCup
  attr_reader :year, :teams

  def initialize(year, teams)
    @year = year
    @teams = teams
  end

  def active_players_by_position(position)
    @teams.map do |team|
      team.players_by_position(position) if team.eliminated? == false
    end.flatten.compact
  end

  def all_players_by_position
    all_players = {}
    @teams.map do |team|
      positions = team.players.map do |player|
        player.info[:position]
      end
      positions.map do |position|
        if all_players[position].nil?
          all_players[position] = team.players_by_position(position)
        else
          players = team.players_by_position(position)
          players.each do |player|
            all_players[position].push(player)
          end
        end
      end
    end
    all_players
  end
end