'''
Since, we already have 0.5 million records in out laptimes table and to replicate the dataset upto a million records without hampering the results of the dataset.

We first identified, number of laps the driver participated in each race.
select race_id, driver_id, count(*) from laptimes group by race_id, driver_id;
and saved it to an excel file.

Then we got all driver's position and time_taken in the last lap for each race.
SELECT m1.race_id, m1.driver_id, m1.position, m1.time_ms
FROM laptimes m1 LEFT JOIN laptimes m2
 ON (m1.race_id = m2.race_id and m1.driver_id=m2.driver_id AND m1.id < m2.id)
WHERE m2.id IS NULL order by race_id, driver_id;
and saved it again to an excel file.

Using the above query we made sure that inserted new records doesn't alter the position and time taken by the drivers in their last lap.



'''
import pandas as pd

df = pd.read_csv('lastpositionrepl.csv')
result = {}
for index, row in df.iterrows():
	key = (row['race_id'], row['driver_id'])
	result[key] = {
		"time": row['time_ms'],
		"position": row["position"],
		"lap": row["lap"]
	}

df = pd.read_csv('laptimes-count-repl.csv')
count_result = {}
for index, row in df.iterrows():
	key = (row['race_id'], row['driver_id'])
	count_result[key] = row['count']

existing_count = 533380

ids = []
race_ids = []
driver_ids = []
laps = []
positions = []
times = []
for key in count_result:
	race_id = key[0]
	driver_id = key[1]
	lap = result[key]["lap"]
	for i in range(count_result[key]):
		existing_count+=1
		ids.append(existing_count)
		race_ids.append(race_id)
		driver_ids.append(driver_id)
		lap += 1
		laps.append(lap)
		positions.append(result[key]["position"])
		times.append(result[key]["time"])

data = {'id': ids, 'race_id': race_ids, 'driver_id': driver_ids, 'lap': laps, 'position': positions, 'time_ms': times}
     
df = pd.DataFrame(data)

df.to_csv('replicate-laptimes.csv', header=None,index=False)
