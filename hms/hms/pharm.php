<?php
session_start();
//error_reporting(0);
include('include/config.php');
include('include/checklogin.php');
check_login();


if(isset($_POST['submit']))
{	
	$patid=$_SESSION['id'];	
	$medid=$_POST['medid'];
$medname=$_POST['medname'];
$medseller=$_POST['medseller'];
$medqty=$_POST['medqty'];

$sql=mysqli_query($con,"insert into cart(patId, mName, mqty, mseller) values('$patid', '$medname','$medqty', '$medseller')");
if($sql)
{
echo "<script>alert('Medicine added Successfully');</script>";
header('location:pharm.php');
$_SESSION['prescriptionStatus']=0;
}
}

?>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Pharmacy</title>
		
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
									<h1 class="mainTitle">USER | PHARMACY</h1>
																	</div>
										<div class="topnav">
										<i class="fa fa-search fa-lg" aria-hidden="true"></i>
  										<input type="text" placeholder="Search..">
										</div>		
								<ol class="breadcrumb">
									<li>
										<span>User</span>
									</li>
									<li class="active">
										<span>Pharmacy</span>
									</li>
								</ol>
							</div>
						</section>
						
						<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
							<div class="container-fluid container-fullw bg-white">
							<div class="row">
								<?php $sql=mysqli_query($con,"select * from medicines");
while($data=mysqli_fetch_array($sql))
{
?>
<?php
$sql1=mysqli_query($con,"select medicines.pharmId as pharmid,pharmacists.*  from pharmacists join medicines on medicines.pharmId=pharmacists.id where pharmacists.id='".$data['pharmId']."' and medicines.mediQuantity>0");

$row1=mysqli_fetch_array($sql1)

?>
								<div class="col-sm-4">
									<div class="panel panel-white no-radius text-center">
										<div class="panel-body">
										<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRqXhmhcWbI7Ax4tmawuy3nLCvz7qBzxGCvYg&usqp=CAU"</img>
										
											<h3 class="StepTitle" name="mname"><b><?php echo $data['mediName'];?></b></h3>
											<h5 class="StepTitle" name="mseller"><span>Seller: </span> <b><?php echo $row1['pharmName'];?></b></h5>
											<h5 class="StepTitle" name="qty"><span>Available quantity: </span><b><?php echo $data['mediQuantity'];?></b></h5>
											<form role="form" name="" method="post">
												<input type='hidden' name='medid' value=<?php echo htmlspecialchars($data['mediId']); ?> >
												<input type='hidden' name='medname' value=<?php echo htmlspecialchars($data['mediName']);?>>
												<input type='hidden' name='medseller' value= <?php echo htmlspecialchars($row1['pharmName']); ?>>
											Quantity:
											<select id="qty" name="medqty"> 
												<?php												
												for($i = 1; $i <= $data['mediQuantity']; $i++)
													{?>
    											<option value="<?php echo htmlspecialchars($i); ?>"><?php echo $i?></option>
   												<?php } ?>
  												</select>

  												
											<p class="links cl-effect-1">
											
												<button type="submit" name="submit" id="submit" class="btn btn-primary btn-xs" style="margin: 15px;">
Add to cart
</button>	
																								
												
											</p>
										</form>
										</div>
									</div>
								</div>
								<?php } ?>
								

								
							</div>
						</div>
		
					
						
						
					
						<!-- end: SELECT BOXES -->
						
					</div>
				</div>
			</div>
			<!-- start: FOOTER -->
	<?php include('include/footer.php');?>
			<!-- end: FOOTER -->
		
			<!-- start: SETTINGS -->
	<?php include('include/setting.php');?>
			<>
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
