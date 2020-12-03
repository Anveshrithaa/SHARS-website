<?php
session_start();
include('include/config.php');
$patid=$_SESSION['id'];
	$sql4=mysqli_query($con, "insert into prescriptions(patid) values (".$patid.")");
	$presid=mysqli_insert_id($con);
	#Downloading and saving prescription
	$info = pathinfo($_FILES['preFile']['name']);
    $ext = $info['extension']; // get the extension of the file
    $newname = "Pres_".$patid."_".$presid.".".$ext; 
	$target = 'prescriptions/'.$newname;
    move_uploaded_file( $_FILES['preFile']['tmp_name'], $target);
	$sql4=mysqli_query($con, "update prescriptions set imageName='".$newname."' where id=".$presid."");
	$_SESSION['prescriptionStatus']=1;
	$item = array($newname);
	$medname=$_POST['mname'];
	print_r($medname);
	$count = count($medname);
    for($i = 0; $i < $count; $i++) 
	{ 
	array_push($item, $medname[$i]);
	}
	$cmd='C:\Users\Raj\AppData\Local\Programs\Python\Python38-32\python C:\Xampp\htdocs\tarp\hospital\hms\test_pres.py '.json_encode($item).' '.$presid;
	pclose(popen("start /B ". $cmd, "r")); 
	exec($cmd . " > /dev/null &");
	sleep(10);
	$sql3=mysqli_query($con,"select ocroutput from prescriptions where id= '".$presid."'");
	$row3=mysqli_fetch_array($sql3);
	echo $row3['ocroutput'];
	for($i = 0; $i < $count; $i++) 
	{ 
echo $medname[$i];
	if(strpos($row3['ocroutput'], $medname[$i])===false)
	{
		$sql5=mysqli_query($con,"delete from cart where patId= '".$_SESSION['id']."' and mName='".$medname[$i]."'");
echo 'deleted';
	}		
	}
	?>