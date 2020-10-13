import sys
import os
import json


__version__ = "0.9.2"

root_path = os.path.abspath(os.path.join(os.path.dirname(__file__)))
data_path = os.path.abspath(os.path.join(root_path, 'data'))

GAMES_DATA_JSON = os.path.join(data_path, "games_data_trim.json")
TEAMS_DATA_JSON = os.path.join(data_path, "teams_data.json")


def get_games_data():
    """
    This returns a string with the file contents of GAMES_DATA_JSON
    """
    if not os.path.exists(GAMES_DATA_JSON):
        raise FileNotFoundError("Error: could not find JSON file %s"%(GAMES_DATA_JSON))
    with open(GAMES_DATA_JSON, 'r') as f:
        result = f.read()
    return result

def get_teams_data():
    """
    This returns a string with the file contents of TEAMS_DATA_JSON
    """
    if not os.path.exists(TEAMS_DATA_JSON):
        raise FileNotFoundError("Error: could not find JSON file %s"%(TEAMS_DATA_JSON))
    with open(TEAMS_DATA_JSON, 'r') as f:
        result = f.read()
    return result

