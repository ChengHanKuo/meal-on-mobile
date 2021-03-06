<?php

require_once 'rankAlgorithmFunction.php';

$hasClass=true;
$criteriaInput=array("distance","frequency","rating");
$duration="20分鐘";
$transferRate=0.05;

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

?>