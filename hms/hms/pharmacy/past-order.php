<?php
session_start();
//error_reporting(0);
include('include/config.php');
include('include/checklogin.php');
check_login();


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
									<h1 class="mainTitle">PHARMACIST | VIEW ORDERS</h1>
																	</div>
								
								<ol class="breadcrumb">
									<li>
										<span>Pharmacist</span>
									</li>
									<li class="active">
										<span>Dashboard</span>
									</li>
								</ol>
							</div>
						</section>
					
			
<!-- end: PAGE TITLE -->
						<!-- start: BASIC EXAMPLE -->
<div class="container-fluid container-fullw bg-white">
							<div class="row">			
<?php
 $sql1=mysqli_query($con,"select pharmName from pharmacists where id='".$_SESSION['id']."'");
	$row1=mysqli_fetch_array($sql1);
	$pname1=$row1['pharmName'];
	$pid=$_SESSION['id'];
	$sql2=mysqli_query($con,"select * from (select patId, mName, mediId, mqty, Status from (select * from orders where mseller='$pname1' and Status!='Placed') as ords inner join (select * from medicines where pharmId=$pid) as meds on ords.mName=meds.mediName) as tabs inner join (select fullName,id from users) as usrs on usrs.id=tabs.patId");
	$tmp='abc';
	while($roww=mysqli_fetch_array($sql2))
	{
	if ($tmp != $roww['patId']) {  // determine if a new group / sid value
        if ($tmp !='abc') {
?>
</table>
											<br>
											
											
											</p>
										</div>
									</div>
								</div>
								
		<?php } ?>
								<div class="col-sm-4">
									<div class="panel panel-white no-radius text-center">
										<div class="panel-body">
											<!--<h2 class="StepTitle">Medicine 1</h2>-->
											<p class="links cl-effect-1">
											<p style="text-align:left">Patient Name: <?php echo $roww['fullName'];?></p>
											<p style="text-align:left">Patient ID: 1<?php echo $roww['patId'];?></p>
											<table style="width:100%">
											<style>
											table {
 											 border-collapse: collapse;
											}

											table, td, th {
 												 border: 1px solid black;
											}
											</style>
											<tr>
												<th>Name</th>
												<th>ID</th> 
												<th>Qty</th>
												<th>Status</th>
											</tr>
	<?php } ?>							
											
											
											<tr>
												<td><?php echo $roww['mName'];?></td>
												<td><?php echo $roww['mediId'];?></td>
												<td><?php echo $roww['mqty'];?></td>
												<td><?php echo $roww['Status'];?></td>
											</tr>
											
	<?php $tmp = $roww['patId'];
			}
if ($tmp !='abc') {
	?>
	</table>
											<br>
											</p>
										</div>
									</div>
								</div>
<?php } ?>
								
											
							</div>
						</div>
		
					
						
						
					
						<!-- end: SELECT BOXES -->
						
					
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
