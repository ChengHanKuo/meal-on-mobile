<?php
require_once "function.php";

$sql="SELECT a.InfoNo, a.InfoName, b.InfoRoad, b.InfoArea, b.InfoFar, c.InfoMoney, c.InfoTel, c.InfoSeat 
	  FROM infoname as a, infolocation as b, infodetail as c 
	  WHERE a.InfoNo=b.InfoNo and b.infoNo=c.infoNo ";

$result=querySQL($sql);
$total=mysql_num_rows($result);
$data= array();

for ($i=0 ;$i<$total; $i++)
	array_push($data, mysql_fetch_assoc($result));

print_r($data);

$location=array();
//$location=new coordinate();
for ($i=0 ;$i<$total; $i++)
{
	array_push($location, addressToCoordinate($data[$i]['InfoRoad']));
	sleep(1);
}
//$location=addressToCoordinate($data[0]['InfoRoad']);

print_r($location);

for ($i=0 ;$i<$total; $i++)
{
	$lat=$location[$i]->latitude;
	$long=$location[$i]->longitude;
	$no=$data[$i]['InfoNo'];
	$sql="UPDATE infolocation SET latitude='$lat',longitude='$long' WHERE InfoNo='$no' ";
	querySQL($sql);
}

?>