<?php


class coordinate 
{
	public $latitude;
	public $longitude;
}

function resturantNoGen()
{
	$resturantNo="R";
	$character=array(a,b,c,d,e,f);
	shuffle($character);

	for($i=0; $i<2; $i++)
		$resturantNo.=$character[$i];
	$number=rand(1000,9999);
	$resturantNo.=$number;
	return $resturantNo;
}

function dbInit()
{
	$db_hostname='localhost';
	$db_database='lunch';
	$db_username='howard';
	$db_password='123456';
	
	$db_server=mysql_connect($db_hostname,$db_username,$db_password);
	if (!db_server) die("Unable to connect to MySQL: ".mysql_error());
	
	mysql_select_db($db_database)
	or die("Unable to select database: ".mysql_erroe());
	
	mysql_query("SET NAMES 'UTF8'");
	mysql_query("SET CHARACTER SET UTF8");
	mysql_query("SET CHARACTER_SET_RESULTS=UTF8'");
}

function dbCreat()
{
	$sql="CREATE";
}

function querySQL($query)
{
	$result=mysql_query($query);
	if (!$result) 
	{
		$error=mysql_error();
		if (preg_match("/Duplicate entry/", $error))
			echo "";
		else
			die(mysql_error());
	}
	return $result;
}

function addressToCoordinate($address)
{
	$requestURL="http://maps.google.com/maps/geo?q=$address&output=csv";
	$response=file_get_contents($requestURL);
	$result=explode(",",$response);
	$returnCoordinate= new coordinate();
	$returnCoordinate->latitude=$result[2];
	$returnCoordinate->longitude=$result[3];
	return $returnCoordinate;
}

function dataReceive($type)
{
	$data= $type=="receive"? json_decode($_POST['data']) : $_POST['data'];
	if (!$data) return "No data";
	return $data;
}

function addRestaurant($data)
{
	print_r($data);
}

function requestRestaurant($type)
{
	if ($type=="all")
	{
		$location= array();
		$query= "SELECT InfoNo, latitude, longitude FROM infolocation";
		$result= querySQL($query);
		
		for ($i=0 ;$i<mysql_num_rows($result); $i++)
		{
			$data=mysql_fetch_assoc($result);
			$location[$data['InfoNo']]= $data;
		}
		
		echo json_encode($location);
	}	
	
	if ($type=="partial")
	{
		$location= array();
		// Set predicate
		$query= "SELECT InfoNo, latitude, longitude FROM infolocation WHERE (predicate)";
	}
}

function personalRecord($userNo)
{
	$query= "select a.InfoName, b.time from infoname as a, userRecord as b where a.InfoNo=b.InfoNo and b.UserNo='AppTest01' order by time desc";
	$result= querySQL($query);
	$record= array();
	for ($i=0; $i<mysql_num_rows($result); $i++)
	{
		$data= mysql_fetch_assoc($result);
		array_push($record, $data);
	}
	
	echo json_encode($record);
}

?>