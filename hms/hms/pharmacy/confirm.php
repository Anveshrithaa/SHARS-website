<?php
include('include/config.php');
$ph=$_GET['pharm'];
$pat=$_GET['pat'];
echo $pat;
echo $ph;
$sql1=mysqli_query($con,"update orders set Status='Confirmed' where mseller='$ph' and patId='$pat'");
//echo 'done';
header("Location: view-order.php");
?>
