#kpis on paack's level
SELECT
	sum(t1.`orders delayed`)/SUM(t1.`orders delivered` + t1.`orders failed`) AS percentage_delayed,
	sum(t1.`orders early`)/SUM(t1.`orders delivered` + t1.`orders failed`) AS percentage_early,
	sum(t1.`orders failed`)/sum(t1.`orders delivered` + t1.`orders failed`) AS percentage_failed,
	ROUND(sum(t1.`orders delivered`)/
	(case
		when hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) = 0 then 1
		when minute(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) > 55 
			then hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) + 1
		ELSE hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) END), 1) AS productivity
FROM drivers_summary t1;

#kpis on drivers' level
SELECT
	t1.driver,
	(t1.`orders delayed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_delayed,
	(t1.`orders early`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_early,
	(t1.`orders failed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_failed,
	ROUND((t1.`orders delivered`)/
	(case
		when hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) = 0 then 1
		when minute(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) > 55 
			then hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) + 1
		ELSE hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) END), 1) AS productivity
FROM drivers_summary t1
GROUP BY t1.driver;

#Top 10 highest percentage_delayed drivers
SELECT
	t1.driver,
	(t1.`orders delayed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_delayed,
	(t1.`orders early`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_early,
	(t1.`orders failed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_failed,
	ROUND((t1.`orders delivered`)/
	(case
		when hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) = 0 then 1
		when minute(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) > 55 
			then hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) + 1
		ELSE hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) END), 1) AS productivity
FROM drivers_summary t1
GROUP BY t1.driver
ORDER BY percentage_delayed DESC
LIMIT 10;

#Top 10 highest percentage_early drivers
SELECT
	t1.driver,
	(t1.`orders delayed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_delayed,
	(t1.`orders early`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_early,
	(t1.`orders failed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_failed,
	ROUND((t1.`orders delivered`)/
	(case
		when hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) = 0 then 1
		when minute(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) > 55 
			then hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) + 1
		ELSE hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) END), 1) AS productivity
FROM drivers_summary t1
GROUP BY t1.driver
ORDER BY percentage_early DESC
LIMIT 10;

#Top 10 highest percentage_failed drivers
SELECT
	t1.driver,
	(t1.`orders delayed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_delayed,
	(t1.`orders early`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_early,
	(t1.`orders failed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_failed,
	ROUND((t1.`orders delivered`)/
	(case
		when hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) = 0 then 1
		when minute(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) > 55 
			then hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) + 1
		ELSE hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) END), 1) AS productivity
FROM drivers_summary t1
GROUP BY t1.driver
ORDER BY percentage_failed DESC
LIMIT 10;

#Top 10 highest productivity drivers
SELECT
	t1.driver,
	(t1.`orders delayed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_delayed,
	(t1.`orders early`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_early,
	(t1.`orders failed`)/(t1.`orders delivered` + t1.`orders failed`) AS percentage_failed,
	ROUND((t1.`orders delivered`)/
	(case
		when hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) = 0 then 1
		when minute(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) > 55 
			then hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) + 1
		ELSE hour(timediff(MAX(str_to_date(t1.`end time`, '%H:%i:%s')), MIN(STR_TO_DATE(t1.`start time`, '%H:%i:%s')))) END), 1) AS productivity
FROM drivers_summary t1
GROUP BY t1.driver
ORDER BY productivity DESC
LIMIT 10;
