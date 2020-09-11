# blaseball-core-game-data

The purpose of this package is to provide blaseball game data
to other packages in a way that is simple and can be done in
one or two lines.

This very simple package consists of a few JSON files, each with
a function that will return a string containing the contents of
that JSON file.

This makes obtaining JSON data about every blaseball game as simple as:

```
import json
import blaseball_core_game_data as gd

# Get games data in a Python dictionary
games = json.loads(gd.get_games_data())

# Get team/league/division data in a Python dictionary
teams = json.loads(gd.get_teams_data())
```

That's all there is to it!

## Installation

### pip

To install this package using pip:

```
pip install blaseball-core-game-data
```

### source

To install this package from source:

```
git clone https://github.com/ch4zm/blaseball-core-game-data
cd blaseball-core-game-data
```

We suggest creating a virtual environment for the installation, e.g.:

```
virtualenv vp
source vp/bin/activate
```

Now build and install the package, and verify that it can be
imported as a module:

```
python setup.py build install
python -m blaseball_core_game_data
```

## The Data

### Game Data

Game data lives here (WARNING: LARGE FILE NOT OPTIMIZED FOR VIEWING!): [`src/data/game_data_trim.json`](https://github.com/ch4zm/interesting-blaseball-games/tree/master/src/data/game_data_trim.json)

Here is the list of keys provided in the game data
(there is a list of dictionaries provided, with each
of the following keys in each dictionary):

* id
* season
* day
* awayOdds
* awayPitcherName
* awayScore
* awayTeamEmoji
* awayTeamName
* awayTeamNickname
* homeOdds
* homePitcherName
* homeScore
* homeTeamEmoji
* homeTeamName
* homeTeamNickname
* isPostseason
* losingTeamName
* losingTeamNickname
* losingTeamEmoji
* losingScore
* losingOdds
* losingPitcherName
* runDiff
* shame
* whoWon
* winningTeamName
* winningTeamNickname
* winningTeamEmoji
* winningScore
* winningOdds
* winningPitcherName

For details of where this information comes from,
see the Scripts section below.

### Team, League, Division Data

NOTE: This only works for teams/leagues/divisions from S1 - S5

NOTE: This file contains `Dale` rather than `Dal\u00e9`, for convenience but
in contrast to the way the team's name is formatted in most API responses.
(Be careful!)

Team, league, and division data lives here: [`src/data/game_data_trim.json`](https://github.com/ch4zm/blaseball-core-game-data/tree/master/blaseball_core_game_data/data/teams_data.json)

Contains two keys, `divisions` and `leagues`, whose keys are the names of the
divisions/leagues, and whose values are the nicknames of the teams in the
given division/league.

## Scripts

The `fetch_game_data.py` script in the `scripts` folder can be
used to update the game data in this package. If you are building
it locally, you can update the game data and re-build the package
so that it contains the latest and most up-to-date blaseball game
data.

To run the script to update the blaseball game data, use this command:

```
python3 scripts/fetch_game_data.py
```

This will update the data in `src/data/`, which will be included
with the package when it is prepared for distribution.

