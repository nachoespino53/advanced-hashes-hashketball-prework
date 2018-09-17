require 'pry'

def game_hash
  {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
          :player_name => "Alan Anderson",
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        }, {
          :player_name => "Reggie Evans",
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, {
          :player_name => "Brook Lopez",
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, {
          :player_name => "Mason Plumlee",
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, {
          :player_name => "Jason Terry",
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        }, {
          player_name: "Bismak Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        }, {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        }, {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        }, {
          player_name: "Brendan Haywood",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

def players_data
  players = game_hash.map do |x, value|
    value[:players]
  end
  players.flatten
end

def num_points_scored(name)
  # players_array = game_hash.values.map do |value|
  #   value[:players] end

  players_array = players_data

  # players_array = players_array.flatten

  players_array.reduce(nil) do |result, player_data|
    if(player_data[:player_name] == name)
      result = player_data[:points]
    end

    result
  end

end

def shoe_size(name)
  # players_array = game_hash.values.map do |value|
  #   value[:players]

  players = players_data

  players.reduce(nil) do |result, player_data|
  if(player_data[:player_name] == name)
    result = player_data[:shoe]
  end

  result

  end

end

def team_colors(team)
  team = game_hash.values.find do |x|
    x[:team_name] == team
  end

  team[:colors]

end

def team_names
  # array = []
  # array << game_hash[:away][:team_name]
  # array << game_hash[:home][:team_name]
  # array

  game_hash.map do |x, team_data|
  team_data[:team_name]
  end
end

def player_numbers(team)
  players =  game_hash.values.find do |team_data|
    team_data[:team_name] == team
  end

  players[:players].map do |x|
    x[:number]
  end

end

def player_stats

end

def big_shoe_rebounds
  players = players_data

  shoe_size = 0
  rebounds = nil

  players.each do |x|
    if x[:shoe] > shoe_size
      rebounds = x[:rebounds]
      shoe_size = x[:shoe]
    end
  end

  rebounds
end

def most_points_scored
  players = players_data
  most_player_name = ''
  most_points = 0

  players.each do |player|
    if player[:points] > most_points
      most_player_name = player[:player_name]
      most_points = player[:points]
    end
  end

  most_player_name

end

def winning_team
  home_player_data = game_hash[:home][:players]
  away_player_data = game_hash[:away][:players]
  home_total = 0
  away_total = 0

  home_player_data.each do |player|
    home_total += player[:points]
  end
  away_player_data.each do |player|
    away_total += player[:points]
  end

  home_total > away_total ? (return game_hash[:home][:team_name]) : (return game_hash[:away][:team_name])

end

def player_with_longest_name
  players = players_data
  longest_player = players[0][:player_name]
  longest_player_length = players[0][:player_name].length

  players.each do |player|
    player[:player_name].length > longest_player_length ?
    (longest_player = player[:player_name]
      longest_player_length = longest_player.length):()
  end

  longest_player
end

def long_name_steals_a_ton?
  players = players_data
  steals = players[0][:steals]
  player_name = players[0][:player_name]
  players.each do |player|
    player[:steals] > steals ? (
    steals = player[:steals]
    player_name = player[:player_name]
  ) : ()
  end

  player_name == player_with_longest_name ? (
    return true
  ) : (
    return false
  )
end
