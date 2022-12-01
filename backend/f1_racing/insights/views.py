from django.shortcuts import render

# Create your views here.

from django.http import JsonResponse
from django.views import View

from django.db import connection

import json

metrics = {

	"drivers_by_positions": '''select r.year as racing_year, r.name as race_name, d.first_name as driver_name, l.position as position from laptimes l join 
(select race_id, max(lap) as max_lap from laptimes group by race_id) 
as temp on ((l.lap)=temp.max_lap and l.race_id=temp.race_id) join drivers d 
on d.driver_id=l.driver_id join races r on r.race_id=l.race_id 
order by r.race_id desc, position;''',

	"winners_by_season": '''select o.name as owner_name, concat(d.first_name,' ',d.last_name) as 
driver_name, r.name as racing_name, r.year as season from results res join 
owners o on res.owner_id=o.owner_id join drivers d on d.driver_id=res.driver_id join 
races r on res.race_id=r.race_id where res.position=1 order by r.year desc;''',

	"countries_with_10_wins": '''Select c.nationality as country from 
	(select d.nationality , COUNT(nationality) as first_place from drivers d,
	results r where r.driver_id=d.driver_id AND position=1 Group by d.nationality ) c  
	where c.first_place>10 order by country;''',

	"owners_wins_by_ciciuit_race": '''select c.name as circuit_name, r.name as race_name, o.name as owner_name, count(*) as wins
from results res join owners o on res.owner_id=o.owner_id join races r on r.race_id=res.race_id 
join circuits c on c.circuit_id=r.race_id
where res.position=1 group by circuit_name, race_name, owner_name order by circuit_name, race_name;''',

 "circuits_unfinished_races": '''select c.name, sum(ct_unfinished) as not_finished from circuits c join races r on r.circuit_id=c.circuit_id join (
select res.race_id as race_id, count(*) as ct_unfinished from results res where res.status_id in 
(select status_id from status where name <> 'Finished') 
 group by res.race_id) as coll on coll.race_id=r.race_id group by c.name order by not_finished desc;''',

 "top_5_drivers_min_lap": '''select r.name as race_name, l.time_ms as min_time, l.lap, l.position, d.first_name as driver from laptimes l join 
(select race_id, time_ms, ROW_NUMBER() OVER(PARTITION BY race_id order by time_ms) as row_num 
from laptimes) as min_times on l.race_id=min_times.race_id join races r on l.race_id=r.race_id
join drivers d on d.driver_id=l.driver_id where l.time_ms=min_times.time_ms 
and min_times.row_num<=5 order by r.name, min_time, l.lap;''',

"least_performing_drivers": '''select o.name as owner_name, d.first_name as driver_name, lp.total_points as points_acheived 
from owners o join (
select owner_id, driver_id, sum(points) as total_points, 
ROW_NUMBER() OVER(PARTITION BY owner_id order by sum(points)) as row_num
from results res join races r on res.race_id=r.race_id 
where r.year>=2012 and res.points<>0 group by owner_id, driver_id) as lp on lp.owner_id=o.owner_id 
join drivers d on lp.driver_id=d.driver_id where row_num<=5 order by owner_name, points_acheived;'''



}

metric_display_values = [
	{
		"key": "top_5_drivers_min_lap",
		"name": "Top 5 Drivers with minimum time taken for a lap in a race!!"
	},
	{
		"key": "drivers_by_positions",
		"name": "Get all drivers with their finishing positions from each race!!"
	},
	{
		"key": "winners_by_season",
		"name": "Get winners by each season!!"
	},
	{
		"key": "owners_wins_by_ciciuit_race",
		"name": "Number of wins of Owners grouped by circuit and race!!"
	},
	{
		"key": "countries_with_10_wins",
		"name": "Countries with atleast 10 wins!!"
	},
	{
		"key": "least_performing_drivers",
		"name": "Top 5 least performing drivers from each owner!!"
	},
	{
		"key": "circuits_unfinished_races",
		"name": "Circuits with most unfinished races!!"
	}

]

class GetQueries(View):

	def get(self, request, *args, **kwargs):
		response = {
			"res_str": "Existing Queries List retrieval successful.",
			"res_data": metric_display_values
		}
		return JsonResponse(data=response, status=200)

class GetQueryResults(View):

	def post(self, request, *args, **kwargs):
		body_unicode = request.body.decode('utf-8')
		body = json.loads(body_unicode)
		query = body.get("query", "").strip()
		metric = body.get("metric", "").strip()
		is_query = True if query else False
		if is_query:
			if not query.strip():
				response = {
					"res_str": "Invalid query cannot be empty!!"
				}
				return JsonResponse(data=response, status=400)
			elif not query.strip().endswith(";"):
				response = {
					"res_str": "Invalid query is not ended properly!!"
				}
				return JsonResponse(data=response, status=400)
		else:
			if not metric.strip():
				response = {
					"res_str": "Invalid query cannot be empty!!"
				}
				return JsonResponse(data=response, status=400)
			elif metric not in metrics:
				response = {
					"res_str": "Invalid value selected!!"
				}
				return JsonResponse(data=response, status=400)
			query = metrics[metric]
		display_columns = []
		data = []
		with connection.cursor() as cursor:
			cursor.execute(query.strip().split(";")[0])
			display_columns = [
			{"key": col[0], "col_name": " ".join(col[0].title().split("_"))} 
			for col in cursor.description]
			columns = [col[0] for col in cursor.description]
			data = [dict(zip(columns, row)) for row in cursor.fetchall()]

		response = {
			"res_str": "",
			"res_data": {
				"columns": display_columns,
				"data": data,
				"query": query.strip()
			}
		}
		return JsonResponse(data=response, status=200)


