<?php
include('include/config.php');
$newname='abdc';
$presid=21;
	
	$sql3=mysqli_query($con,"select ocroutput from prescriptions where id= '".$presid."'");
	$row3=mysqli_fetch_array($sql3);
	echo $row3['ocroutput'];
?>