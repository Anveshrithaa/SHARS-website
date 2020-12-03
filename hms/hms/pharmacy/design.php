<?php
session_start();
//error_reporting(0);
include('include/config.php');
?>
<div class="container-fluid container-fullw bg-white">
							<div class="row">			
<?php
 $sql1=mysqli_query($con,"select pharmName from pharmacists where id='".$_SESSION['id']."'");
	$row1=mysqli_fetch_array($sql1);
	$pname1=$row1['pharmName'];
	$pid=$_SESSION['id'];
	$sql2=mysqli_query($con,"select * from (select patId, mName, mediId, mqty from (select * from orders where mseller='$pname1') as ords inner join (select * from medicines where pharmId=$pid) as meds on ords.mName=meds.mediName) as tabs inner join (select fullName,id from users) as usrs on usrs.id=tabs.patId");
	$tmp=null;
	while($roww=mysqli_fetch_array($sql2))
	{
	if ($tmp != $roww['patId']) {  // determine if a new group / sid value
        if ($tmp !== null) {
?>
</table>
											<br>
											<button type="button" class="btn btn-success btn-xs">Approve</button>
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
											</tr>
	<?php } ?>							
											
											
											<tr>
												<td><?php echo $roww['mName'];?></td>
												<td><?php echo $roww['mediId'];?></td>
												<td><?php echo $roww['mqty'];?></td>
											</tr>
											
	<?php $tmp = $roww['patId'];
			}
if ($tmp !== null) {
	?>
	</table>
											<br>
											<button type="button" class="btn btn-success btn-xs">Approve</button>
											</p>
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