<?php
$con = mysqli_connect("localhost","id20854021_ram","Moradiya@parth007","id20854021_student") or die("not connet database");
$name=$_REQUEST['name'];
$contact=$_REQUEST['contact'];
$email=$_REQUEST['email'];
$image_name ="myimg1/img".rand(100,1000).".jpg";
file_put_contents($image_name, base64_decode($_REQUEST['image']));

$qry="insert into online_000webhost values(null,'$name','$contact','$email','$image_name')";

$res=mysqli_query($con,$qry);

if($res)
{
		echo "data inserted...";
}

else
{
	echo "data not inserted";
}

?>