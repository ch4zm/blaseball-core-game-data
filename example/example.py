import json
import blaseball_core_game_data as gd

# Get games data in a Python dictionary
games = json.loads(gd.get_games_data())

# Get team/league/division data in a Python dictionary
teams = json.loads(gd.get_teams_data())

print("List of divisions:")
for division in teams['divisions']:
    print(" - %s"%(division))
