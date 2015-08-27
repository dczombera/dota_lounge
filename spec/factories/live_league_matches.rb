FactoryGirl.define do
  factory :live_league_match do
    players [
                {
                    "account_id": 121553321,
                    "name": "Hunter01",
                    "hero_id": 0,
                    "team": 2
                },
                {
                    "account_id": 102777720,
                    "name": "EternaL <3",
                    "hero_id": 0,
                    "team": 0
                },
            ]
    radiant_team {{
        "team_name": "Defense The Royals",
        "team_id": 181863,
        "team_logo": 52111985955342458,
        "complete": false }}
    dire_team {{
      "team_name": "NovaG",
          "team_id": 2289551,
          "team_logo": 425942367897532973,
          "complete": false
    }}
    lobby_id 24168344559445586
    match_id 1748434161
    spectators 1
    league_id 3588
    stream_delay_s 120
    radiant_series_wins 1
    dire_series_wins 1
    series_type 0
    league_series_id 0
    league_game_id 0
    league_tier 1
    scoreboard {{
        "duration": 0,
        "roshan_respawn_timer": 0}}
  end

end
