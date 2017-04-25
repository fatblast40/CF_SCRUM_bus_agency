<?php
require_once('includes/start_session_user.php');
?>

<?php

?>
<!DOCTYPE html>
<html>
<head>
	<title>My reservations</title>
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
	        <li class=""><a href="home_user.php">Offers</a></li>
			<li class=""><a href="reservation.php">Booking</a></li>
			<li class="active"><a href="my_reservations.php">My Reservations</a></li>
			<li class=""><a href="change_personal_data.php">Change Personal Data</a></li>
	      </ul>

	    </div><!--/.nav-collapse -->
			        	<?php
require_once('includes/switch_user_view.php');
		?>

	  </div>

		<?php
require_once('includes/header.php');
		?>

	<!-- main -->
	<div class="row">
		<div class="col-xs-12">
			<section class="row">
				<!-- <div class="col-xs-12">
					<h3 class="brandfont text-center color_bc1">
						My Reservations
					</h3>
					<hr class="border_bc1 ">	
				</div> -->
				
	<div class="col-xs-12 margin-top">
          	
      <!-- tabs left -->
      <div class="row tabbable tabs-left">
        <ul class="col-xs-1 nav nav-tabs">
          <li class="active"><a href="#a" data-toggle="tab">Current</a></li>
          <li><a href="#b" data-toggle="tab">Historic</a></li>
        </ul>
        <div class="tab-content">
         <div class="col-xs-11 tab-pane active" id="a">
	         <div class="row">
				<div class="col-xs-12">
					<h3 class="brandfont text-center color_bc1">
						My Current Reservations
					</h3>
					<hr class="border_bc1 ">	
				</div>
			</div>
         </div>
         <div class="col-xs-11 tab-pane" id="b">
	         <div class="row">
				<div class="col-xs-12">
					<h3 class="brandfont text-center color_bc1">
						My Historic Reservations
					</h3>
					<hr class="border_bc1 ">
					<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>adsf	
				</div>
			</div>
         </div>
        </div>
      </div>
      <!-- /tabs -->
      
    </div>   







			</section>
		</div>
	</div>

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