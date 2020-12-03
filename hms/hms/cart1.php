<?php
session_start();
error_reporting(0);
include('include/config.php');
include('include/checklogin.php');
check_login();


if(isset($_POST['submit']))
{	
	$patid=$_SESSION['id'];	
	
	$sql=mysqli_query($con,"insert into orders(patId) values ('$patid')");
    $orderid=mysqli_insert_id($con);

$medname=$_POST['mname'];
$medseller=$_POST['mseller'];
$medqty=$_POST['mqty'];

$count = count($medname);
for($i = 0; $i < $count; $i++) 
{ 

$sql=mysqli_query($con,"insert into order_details(orderId, PharmId, MId, mqty) values('$orderid',  '$medseller[$i]', '$medname[$i]','$medqty[$i]')");

$sql1=mysqli_query($con,"select * from pharmacists where pharmName='".$medseller[$i]."'");
$row1=mysqli_fetch_array($sql1);

$sql2=mysqli_query($con,"update medicines set mediQuantity = mediQuantity - $medqty[$i] where mediName = '".$medname[$i]."' and pharmId = '".$row1['id']."'");
$_SESSION['prescriptionStatus']=0;

}
if($sql)
{

$sql3=mysqli_query($con,"delete from cart where patId= '".$_SESSION['id']."'");	
echo "<script>alert('Order placed');</script>";
header('location:pharm.php');

}
}

if(isset($_POST['submitPres']))
{	
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
	$count = count($medname);
    for($i = 0; $i < $count; $i++) 
	{ 
	array_push($item, $medname[$i]);
	}
	$cmd='C:\Users\Raj\AppData\Local\Programs\Python\Python38-32\python C:\Xampp\htdocs\tarp\hospital\hms\test_pres.py '.json_encode($item).' '.$presid;
	pclose(popen("start /B ". $cmd, "r")); 
	exec($cmd . " > /dev/null &");
	sleep(7);
	$sql3=mysqli_query($con,"select ocroutput from prescriptions where id= '".$presid."'");
	$row3=mysqli_fetch_array($sql3);
	//echo $row3['ocroutput'];
	$_SESSION['presmsg']='Prescription checked. ';
	$_SESSION['presremoved']='';
	for($i = 0; $i < $count; $i++) 
	{ 
	//echo $medname[$i];
	if(strpos($row3['ocroutput'], $medname[$i])===false)
	{
		$sql5=mysqli_query($con,"delete from cart where patId= '".$_SESSION['id']."' and mName='".$medname[$i]."'");
		//echo 'deleted';
		$_SESSION['presremoved'].=$medname[$i].' ';
	}	
	}	
	$_SESSION['prescriptionStatus']=2;
	if(strlen($_SESSION['presremoved'])>=2)
		$_SESSION['presremoved'].=' not found in prescription and removed from cart.';
	header("Refresh:0");
}
?>


<!DOCTYPE html>
<html lang="en">
	<head>
		<title>User |Cart</title>
		
		<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
		<link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
		<link rel="stylesheet" href="vendor/fontawesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="vendor/themify-icons/themify-icons.min.css">
		<link href="vendor/animate.css/animate.min.css" rel="stylesheet" media="screen">
		<link href="vendor/perfect-scrollbar/perfect-scrollbar.min.css" rel="stylesheet" media="screen">
		<link href="vendor/switchery/switchery.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.css" rel="stylesheet" media="screen">
		<link href="vendor/select2/select2.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-datepicker/bootstrap-datepicker3.standalone.min.css" rel="stylesheet" media="screen">
		<link href="vendor/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" media="screen">
		<link rel="stylesheet" href="assets/css/styles.css">
		<link rel="stylesheet" href="assets/css/plugins.css">
		<link rel="stylesheet" href="assets/css/themes/theme-1.css" id="skin_color" />
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script>
    $(document).ready(function(){
        
        
        // Find and remove selected table rows
        $("#delete-row").click(function(){
            $("#bill").find('input[name="record"]').each(function(){
              if($(this).is(":checked")){
                    $(this).parents("tr").remove();
                }
            });
        });
    });    
</script>
	</head>
	<body>
		<div id="app">		
<?php include('include/sidebar.php');?>
			<div class="app-content">
				

					<?php include('include/header.php');?>
				<!-- end: TOP NAVBAR -->
				<div class="main-content" >
					<div class="wrap-content container" id="container">
						<!-- start: PAGE TITLE -->
						<section id="page-title">
							<div class="row">
								<div class="col-sm-8">
									<h1 class="mainTitle">User  | Cart</h1>
																	</div>
								<ol class="breadcrumb">
									<li>
										<span>User </span>
									</li>
									<li class="active">
										<span> Cart</span>
									</li>
								</ol>
							</div>
						</section>
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
						<div class="container-fluid container-fullw bg-white" style="width: 80%; margin-left: 10%; margin-right: 10%">
						
<form role="form" name="" method="post" enctype="multipart/form-data">
									<div class="row">
								<div class="col-md-12" >
									
									<p style="color:red;"><?php echo htmlentities($_SESSION['msg']);?>
								<?php echo htmlentities($_SESSION['msg']="");?></p>	
									<table class="table table-hover" id="bill">
										<thead>
											<tr>
												<th class="center">Select</th>												
												<th class="center">Medicine  Name</th>												
												<th class="center">Quantity</th>
												<th class="center">Seller Name </th>												
											</tr>
											</thead>
											<?php $sql=mysqli_query($con,"select * from cart where patId='".$_SESSION['id']."'");
											while($data=mysqli_fetch_array($sql))
											{
											?>
                                            <tr>
                                            	<td class="center"><input type="checkbox" name="record"></td>							
												<td class="center"><input type='hidden' name='mname[]' value=<?php echo htmlspecialchars($data['mName']);?>><?php echo $data['mName'];?></td>
												<td class="center"><input type='hidden' name='mqty[]' value= <?php echo htmlspecialchars($data['mqty']); ?>><?php echo $data['mqty'];?></td>
												<td class="center"><input type='hidden' name='mseller[]' value= <?php echo htmlspecialchars($data['mseller']); ?>><?php echo $data['mseller'];?></td>

																								
											</tr>

											


                                            <?php } ?>
                                           
										
                                       
									</table>
									<button type="button" class="btn btn-danger btn-xs" id="delete-row">Delete item</button>
									
                                                                         
                                <div class="pre-file">
                                    <br><label class="pre-file-label" for="preFile"> Upload Prescription</label>
                                        <input type="file" class="pre-file-input" id="preFile" name="preFile" accept="image/*" >
										<br> <button type="submit" name="submitPres" id="submitPres" class="btn btn-success">Submit</button>
										<?php if($_SESSION['prescriptionStatus']==1) echo "Please wait while we analyze your prescription"; else if($_SESSION['prescriptionStatus']==2){ echo $_SESSION['presmsg']; echo $_SESSION['presremoved'];}?>
                                          <br> <br> <button type="submit" name="submit" id="submit" class="btn btn-success" <?php if($_SESSION['prescriptionStatus']!=2) echo 'disabled'?>>Place Order</button>
                                </div>
                            </form>
								</div>
							</div>
								</div>
                                

						<!-- end: BASIC EXAMPLE -->
						<!-- end: SELECT BOXES -->
						
					</div>
				</div>
			</div>
            
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			
			<!-- end: SETTINGS -->
		</div>
		<!-- start: MAIN JAVASCRIPTS -->
		<script src="vendor/jquery/jquery.min.js"></script>
		<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
		<script src="vendor/modernizr/modernizr.js"></script>
		<script src="vendor/jquery-cookie/jquery.cookie.js"></script>
		<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
		<script src="vendor/switchery/switchery.min.js"></script>
		<!-- end: MAIN JAVASCRIPTS -->
		<!-- start: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<script src="vendor/maskedinput/jquery.maskedinput.min.js"></script>
		<script src="vendor/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
		<script src="vendor/autosize/autosize.min.js"></script>
		<script src="vendor/selectFx/classie.js"></script>
		<script src="vendor/selectFx/selectFx.js"></script>
		<script src="vendor/select2/select2.min.js"></script>
		<script src="vendor/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
		<script src="vendor/bootstrap-timepicker/bootstrap-timepicker.min.js"></script>
		<!-- end: JAVASCRIPTS REQUIRED FOR THIS PAGE ONLY -->
		<!-- start: CLIP-TWO JAVASCRIPTS -->
		<script src="assets/js/main.js"></script>
		<!-- start: JavaScript Event Handlers for this page -->
		<script src="assets/js/form-elements.js"></script>
		<script>
			jQuery(document).ready(function() {
				Main.init();
				FormElements.init();
			});
		</script>
		<!-- end: JavaScript Event Handlers for this page -->
		<!-- end: CLIP-TWO JAVASCRIPTS -->
	</body>
</html>
