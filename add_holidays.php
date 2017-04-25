<?php
require_once('includes/start_session_admin.php');
?>
<?php

?>
<!DOCTYPE html>
<html>
<head>
	<title>Add Holidays - Admin</title>
	<?php
require_once('includes/head_tag.php');
	?>
</head>
<body>
<div id="wrap">
  <div id="main" class="container clear-top">

	<div class="navbar navbar-inverse navbar-fixed-top">	
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle pull-left" data-toggle="collapse" data-target=".navbar-collapse">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <!-- <a class="navbar-brand" href="#">Brand</a> -->

	    </div>
	    <div class="collapse navbar-collapse">
	      <ul class="nav navbar-nav">
	        <li><a href="home_admin.php">Risky Rides</a></li>
	        <li><a href="all_rides.php">All Rides</a></li>
	        <li><a href="all_users.php">All Users</a></li>
	        <li class="active"><a href="add_holidays.php">Add holidays</a></li>
	      </ul>

	    </div><!--/.nav-collapse -->
			        	<?php
	require_once('includes/switch_admin_view.php');
		?>

	  </div>
		<?php
	require_once('includes/header.php');
		?>

<!-- main -->
	<section class="row">
		<div class="col-xs-12">
		<h3 class="brandfont text-center color_bc1">
			Add Holidays
		</h3>
		<hr class="border_bc1 ">	
	</div>
<!-- put content here -->

	</section>
<!-- end wrapper to put footer on the bottom of the page -->
  </div>
</div>
	<!-- footer -->
	<?php
require_once('includes/footer.php');
	?>
	 
</body>
</html>
<?php ob_end_flush(); ?>