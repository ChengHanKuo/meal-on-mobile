<?php

function getCriteriaWeight($criteriaInput, $hasClass, $transferRate)
{
	$criteriaWeight=array();
	$n=count($criteriaInput);

	for ($i=0; $i<$n; $i++)
		$criteriaWeight[$criteriaInput[$i]]=1/$n;

	if ($hasClass)
	{
		$weightTransfer=0;
		foreach ($criteriaWeight as $key=>$value)
		{
			if ($key=="distance") continue;
			$weightTransfer+=$transferRate;
			$criteriaWeight[$key]-=$transferRate;
		}
		$criteriaWeight['distance']+=$weightTransfer;
	}

	return $criteriaWeight;
}

function getTimeWeight($duration)
{
	$timeTable=array("10分鐘"=>6,"20分鐘"=>5,"30分鐘"=>4,"40分鐘"=>3,"50分鐘"=>2,"60分鐘"=>1);
	return $timeTable[$duration];
}

function getDistance($currentLat, $currentLng, $hasClass)
{
	$distance=array();
	$query="SELECT InfoNo, latitude, longitude FROM infolocation";
	$result=querySQL($query);
	for ($i=0 ;$i<mysql_num_rows($result); $i++)
	{
		$data=mysql_fetch_assoc($result);
		$distance[$data['InfoNo']]=distanceCalculate($currentLat, $currentLng, $data['latitude'], $data['longitude']);
	}

	if ($hasClass=="true")
	{
		foreach ($distance as $key=>$value)
			$distance[$key]=(1/$value);
	}

	return $distance;
}

function distanceCalculate($lat1, $lng1, $lat2, $lng2)
{
	$pi80 = M_PI / 180;
	$lat1 *= $pi80;
	$lng1 *= $pi80;
	$lat2 *= $pi80;
	$lng2 *= $pi80;

	$r = 6372.797; // mean radius of Earth in km
	$dlat = $lat2 - $lat1;
	$dlng = $lng2 - $lng1;
	$a = sin($dlat / 2) * sin($dlat / 2) + cos($lat1) * cos($lat2) * sin($dlng / 2) * sin($dlng / 2);
	$c = 2 * atan2(sqrt($a), sqrt(1 - $a));
	$km = $r * $c;

	return $km;
}

function getFrequency()
{
	$frequency=array();
	$query="SELECT InfoNo FROM infoname";
	$result=querySQL($query);
	for ($i=0 ;$i<mysql_num_rows($result); $i++)
	{
		$data=mysql_fetch_assoc($result);
		$frequency[$data['InfoNo']]=1;
	}

	return $frequency;
}

function getRating()
{
	$rating=array();
	$query="SELECT InfoNo FROM infoname";
	$result=querySQL($query);
	for ($i=0 ;$i<mysql_num_rows($result); $i++)
	{
		$data=mysql_fetch_assoc($result);
		$rating[$data['InfoNo']]=1;
	}

	return $rating;
}

function rankCalculator($distance, $frequency, $rating)
{
	$rankList=array();


	return $rankList;
}

function rankAlgorithm($hasClass, $criteriaInput, $duration, $transferRate)
{
	$criteriaWeight=getCriteriaWeight($criteriaInput, $hasClass, $transferRate);
	$timeWeight= $hasClass ? getTimeWeight($duration) : 1;

	$rankList=array();
	$distance=getDistance(22.6178800 , 120.3137630 , $hasClass);
	$frequency=getFrequency();
	$rating=getRating();

	$total=count($distance);
	$keys=array_keys($distance);

	for ($i=0; $i<$total; $i++)
	{
		$distanceValue=$distance[$keys[$i]]*$criteriaWeight['distance']*$timeWeight;
		$frequencyValue=$frequency[$keys[$i]]*$criteriaWeight['frequency'];
		$ratingValue=$rating[$keys[$i]]*$criteriaWeight['rating'];
		$rankList[$keys[$i]]=$distanceValue+$frequencyValue+$ratingValue;
	}

	arsort($rankList);
	print_r($rankList);
}

function rankRestaurant($data)
{
	$hasClass=$data->{'hasClass'};
	$criteriaInput=array("distance","frequency","rating");
	$duration=$data->{'timeSelect'};
	$transferRate=0.05;
	rankAlgorithm($hasClass, $criteriaInput, $duration, $transferRate);
}

?>