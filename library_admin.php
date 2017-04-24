<?php
require_once('includes/start_session_admin.php');
?>

<?php
// EDIT OPENING HOURS
		if(isset($_POST['btn_opening_hours'])) {
			// prevent sql injections/ clear user invalid inputs
			$open_at = trim($_POST['open_at']);
			$open_at = strip_tags($open_at);
			$open_at = htmlspecialchars($open_at);
			
			$close_at = trim($_POST['close_at']);
			$close_at = strip_tags($close_at);
			$close_at = htmlspecialchars($close_at);		  

				// echo "no error";
				$query_opening_hours = "UPDATE libraries SET open_from=TIME_FORMAT('$open_at', '%H:%i:%s'), open_to=TIME_FORMAT('$close_at', '%H:%i:%s') ";
				$res_opening_hours = mysql_query($query_opening_hours);

				if ($res_opening_hours) {
					$errTyp = "alert alert-success";
					$errMSG = "Successfully changed opening hours! The library is now opened from $open_at to $close_at!";
					// echo $errMSG_add_genre;
					unset($add_genre);
				} else {
					$errTyp = "alert alert-danger";
					$errMSG = "Something went wrong, try again later...";
					// echo $errMSG_add_genre;
				}
		}
?>
<!DOCTYPE html>
<html>
<head>
	<title>Change Opening Hours</title>
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
	        <li class=""><a href="home_admin.php">Add Book</a></li>
	        <li class="active"><a href="library_admin.php">Opening Hours</a></li>
	        <li class=""><a href="all_books_admin.php">All Books</a></li>
	        <li class=""><a href="all_users_admin.php">All Users</a></li>
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
			<h2 class="brandfont text-center">Change Opening Hours</h2>
			<hr>
		</div>
		<form class="col-xs-12" method="post">
			<?php
	            if ( isset($_POST['btn_opening_hours']) ) {
			
require_once('includes/alert_box.php');
		
	            }
          	?>
			<div class="row text-center">
				<!-- first_row -->
				<div class="col-xs-6 col-xs-offset-3 col-md-4 col-md-offset-1">
				<!-- OPEN AT -->
				  <h4>Open at:</h4>
				  <input step="1" type="time" name="open_at" id="open_at" class="text-center form-control" placeholder="When will you open the library?">				 
				</div>
				<!-- second row-->
				<div class="col-xs-6 col-xs-offset-3 col-md-4 col-md-offset-2">
				<!-- CLOSE AT -->
				  <h4>Close at:</h4>
				  <input step="1" type="time" name="close_at" id="close_at" class="text-center form-control" placeholder="When will you close the library?">				 
				</div>
				<div class="col-xs-12">
					 <!-- SUBMIT -->
         			<hr />
          			<button type="submit" id="btn_opening_hours" class="btn btn-block btn-primary" name="btn_opening_hours">Change opening hours</button>
				</div>
			</div>
		</form>
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