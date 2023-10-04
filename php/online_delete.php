<?php
$con = mysqli_connect("localhost","id20854021_ram","Moradiya@parth007","id20854021_student") or die("not connet database");

$id=$_REQUEST['id'];

$qry="delete from online_000webhost where id=$id";

$res=mysqli_query($con,$qry);

if($res)
{
	echo "your recored is deleted...";
}

else
{
	echo "your recored not deleted try agin..";
}

	
?>