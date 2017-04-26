<?php
require_once('includes/start_session_user.php');
?>

<?php

?>
<!DOCTYPE html>
<html>
<head>
	<title>Booking</title>
	<?php
require_once('includes/head_tag.php');
	?>
    <link rel="stylesheet" href="css/busdiagram.css">

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
			<li class="active"><a href="reservation.php">Booking</a></li>
			<li class=""><a href="my_reservations.php">My Reservations</a></li>
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
				<div class="col-xs-12">
					<h3 class="brandfont text-center color_bc1">
						Booking
					</h3>
					<hr class="border_bc1 ">	
				</div>
				<!-- add data here -->
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">Please pick your seat!</div>
                        <div class="seats-diagram"></div>
                    </div>
                </div>
			</section>
		</div>
	</div>


	<!-- footer -->
	<?php
require_once('includes/footer.php');
	?>
      <script type="application/javascript" src="js/busdiagram.js"></script>

</body>
</html>
<?php ob_end_flush(); ?>