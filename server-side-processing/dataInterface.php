<?php

require_once 'function.php';
require_once 'rankAlgorithmFunction.php';
dbInit();

if (isset($_POST['dataType']))
{
	$dataType= $_POST['dataType'];
	$data= dataReceive("receive");
	
	switch ($dataType)
	{
		case "newRestaurant": addRestaurant($data); break;
		case "rankRestaurant": rankRestaurant($data); break;
		case "requestRestaurant": requestRestaurant($data); break;
	}
}

else if (isset($_POST['requestType']))
{
	$requestType= $_POST['requestType'];
	$data= dataReceive("request");
	switch ($requestType)
	{
		case "getLocationAll": requestRestaurant($data); break;
		case "getRanking": rankRestaurant($data); break;
		case "personalRecord": personalRecord($data); break;
	}
}

else 
	die("No data type specify");


?>