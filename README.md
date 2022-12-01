# F1-Racing dataset Analysis

## CSE 560 DMQL(Data Model Query Language):
![](erDiagram.png?raw=true "Title")

---

## Introduction
Application to interact with database. We have chosen Formula 1 (F1) World Champion of auto racing and many view it to be the largest sporting league.
## Target Users
The F1 database can be used by many users and admins.
###### Users can be:
###### Admin the F1 authority like The Formula One Group (FIA):
Admin has all the write privileges to the database. He can add upcoming tournament details, add the schedule and location details associated with the tournament. Any changes/removal to the existing data can be performed by the admins.
###### Game Analysts:
F1 db can be used by the game analysts to get the past data and predict and analyze the game results.
###### Drivers:
Drivers can view the leaderboard and track their records. Get details about the schedule of upcoming races.
###### Brand Owners or Sponsors:
who can manage the players under their brand. When a brand owner wants to get the track record of any player this db can be useful.
###### F1 fans:
Fans can view the stats of past races, schedule of upcoming races and venues.

<<<<<<< HEAD
---

## Instructions for code-setup:

###### Backend:
- `cd backend`.
- All development wrt backend can be found here.
- SetUp
  - Update env fields in file `cd backend/f1-racing/.env`. 
    - DB_NAME (POSTGRESQL DatabaseName)
    - DB_HOST (POSTGRESQL HostName)
    - DB_USER (POSTGRESQL UserName)
    - DB_PASSWORD (POSTGRESQL Password.)
- StartUp
  - `cd f1-racing`
  - `./manage.py runserver <port-number>`

###### Frontend:
- `cd frontend`.
- All development wrt frontend can be found here.
- StartUp:
  - `npm install`
  - `npm start` by default runs on port 3000.

###### Datafiles:
- `cd data_files`. 
- Contains `create.sql` and `load.sql` files to regenerate the dataset.
- DataReplication:
  - Go to `utils.py` and follow the instructions to span 0.5 million to 1 million records on `laptimes` table in the database.
