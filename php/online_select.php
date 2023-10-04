<?php
$con = mysqli_connect("localhost","id20854021_ram","Moradiya@parth007","id20854021_student") or die("not connet database");

$qry ="select * from online_000webhost";
	
	$res = mysqli_query($con,$qry);
	$ar = array();
	
	while($arr=mysqli_fetch_assoc($res))  

	{
			$ar[]=$arr;
	}
	echo json_encode($ar);
	
?>