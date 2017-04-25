<?php
require_once('includes/start_session_user.php');
?>

<?php
$error = 0;
 $emailError ="";
 $firstnameError ="";
 $familynameError ="";
 $emailError ="";
 $passError ="";
 $titlenameError ="";

 $telephoneError ="";
 $yearError ="";
 $avatarError ="";
 $countryError ="";
 $ibanError ="";
 $errTyp="";
 $errMSG="";


 if ( isset($_POST['btn-change_data']) ) {
  // sanitize user input to prevent sql injection
  // $username = trim($_POST['username']);
  // $username = strip_tags($username);
  // $username = htmlspecialchars($username);
 
  $email = trim($_POST['email']);
  $email = strip_tags($email);
  $email = htmlspecialchars($email);
 
  $password = trim($_POST['password']);
  $password = strip_tags($password);
  $password = htmlspecialchars($password);

  $password_old = trim($_POST['password_old']);
  $password_old = strip_tags($password_old);
  $password_old = htmlspecialchars($password_old);

  $first_name = trim($_POST['first_name']);
  $first_name = strip_tags($first_name);
  $first_name = htmlspecialchars($first_name);

  $family_name = trim($_POST['family_name']);
  $family_name = strip_tags($family_name);
  $family_name = htmlspecialchars($family_name);

  $telephone = trim($_POST['telephone']);
  $telephone = strip_tags($telephone);
  $telephone = htmlspecialchars($telephone);

  $year = trim($_POST['year']);
  $year = strip_tags($year);
  $year = htmlspecialchars($year);

  $country = trim($_POST['country']);
  $country = strip_tags($country);
  $country = htmlspecialchars($country);

  $iban = trim($_POST['iban']);
  $iban = strip_tags($iban);
  $iban = htmlspecialchars($iban);


  $title = $_POST['title'];

  $avatar = $_POST['avatar'];
    // if (empty($avatar)){
    //   $avatar = 1;
    // }

  // basic username validation
  // if (empty($username)) {
  //  $error = 1;
  //  $nameError = "Please enter your user name.";
  // } else if (strlen($username) < 3) {
  //  $error = 1;
  //  $nameError = "Name must have atleat 3 characters.";
  // } else {
  //  // check whether the username exist or not
  //  $query_username = "SELECT username FROM users WHERE users.username='$username'";
  //  $result_username = mysql_query($query_username);
  //  $count_username = mysql_num_rows($result_username);
  //  if($count_username!=0){
  //   $error = 1;
  //   $nameError = "Provided user name is already in use.";
  //  }
  // }
  // echo " username: $error<br>";
 
  //basic email validation
  if ( !filter_var($email,FILTER_VALIDATE_EMAIL) ) {
   $error = 1;
   $emailError = "Please enter valid email address.";
  } else {
   // check whether the email exists or not
   $query_email = "SELECT email FROM user WHERE user.email='$email' AND user.id != ".$_SESSION['user'];
   $result_email = mysqli_query($con, $query_email);
   $count_email = mysqli_num_rows($result_email);
   if($count_email!=0){
    $error = 1;
    $emailError = "Provided Email is already in use.";
   }
  }
    // echo " email: $error<br>";

  // password validation
  if (empty($password)){
   $error = 1;
   $passError = "Please enter password.";
  } else if(strlen($password) < 6) {
   $error = 1;
   $passError = "Password must have atleast 6 characters.";
  }
      // echo " password: $error<br>";

 
  // password encrypt using SHA256();
  // not even the admin can see the password anymore
  $password = hash('sha256', $password);
  

  if(empty($password_old)){
   $error = 1;
   $passError = "Please enter your password.";
  }

  $password_old = hash('sha256', $password_old);

  // firstname validation
  if (empty($first_name)){
   $error = 1;
   $firstnameError = "Please enter your first name.";
  }
      // echo " firstname: $error<br>";

  // family_name validation
  if (empty($family_name)){
   $error = 1;
   $familynameError = "Please enter your family name.";
  }
      // echo " familyname: $error<br>";
  
  // telephone validation
  if (empty($telephone)){
   $error = 1;
   $telephoneError = "Please enter your telephone number.";
  }
      // echo " telephone number: $error<br>";

  // year of brith validation
  if (empty($year)){
   $error = 1;
   $yearError = "Please enter your year of birth.";
  }
      // echo " year of birth: $error<br>";
  
  // IBAN validation
  if (empty($iban)){
   $error = 1;
   $ibanError = "Please enter your IBAN.";
  }
      // echo " year of birth: $error<br>";

  // Avatar validation
  if (empty($avatar)){
   $error = 1;
   $avatarError = "Please choose an avatar.";
  }
        // echo " avatar: $error<br>";
        // 
    // country of residence validation
  if (empty($country)){
   $error = 1;
   $countryError = "Please enter your country of residence.";
  }

  // if there's no error, continue to signup
  
  if( $error == 0 ) {
   // echo "no error";
   
   $user_query = "SELECT id, email, last_name, password FROM user WHERE email='$user_email'";
   $res_user = mysqli_query($con, $user_query);
   $row_user = mysqli_fetch_array($res_user);
   // echo $row_user['email'];
   // $count_user = mysqli_num_rows($res_user); 

	   if($row_user['password']==$password_old ) {
		   $query_user = "UPDATE user SET
		   first_name='$first_name',
		   last_name='$family_name', 
		   email='$email',
		   password='$password', 
		   title_id=$title, 
		   avatar_id=$avatar, 
		   tel='$telephone', 
		   birth_year=$year
		   WHERE user.id=".$_SESSION['user'];
		   $res_user = mysqli_query($con, $query_user);
		  
		   // echo $iban;
		   // echo '<br>'.$user_id;
		   $query_payment = "UPDATE payment SET
		   iban='$iban' WHERE user_id=".$_SESSION['user'];
		   $res_payment = mysqli_query($con, $query_payment);
		   
		   if ($res_user AND $res_payment) {
		    $errTyp = "alert-success";
		    $errMSG = "Your Data was successfully changed!";
		    // echo $errMSG;
		    // unset($username);
		    unset($email);
		    unset($password);
		    unset($first_name);
		    unset($family_name);
		    unset($telephone);
		    unset($year);
		    unset($country);
		    unset($iban);
		    unset($title);
		    // unset($DOB);
		   } else {
		    $errTyp = "alert-danger";
		    $errMSG = "Something went wrong, try again later...";
		    // echo $errMSG;
		   }
		   
		  } else {
		  	echo '<br><br><br><br><br>password incorrect';
		  } 
	 
	 }
 }

?>
<!DOCTYPE html>
<html>
<head>
	<title>Change Personal Data</title>
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
			<li class=""><a href="my_reservations.php">My Reservations</a></li>
			<li class="active"><a href="change_personal_data.php">Change Personal Data</a></li>
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
	<section class="row">
	<div class="col-xs-12">
	<div class="row">

	<div class="col-xs-12">
		<h3 class="brandfont text-center color_bc1">
			Change Personal Data
		</h3>
		<hr class="border_bc1 ">	
	</div>

	<form method="post" autocomplete="off">

	 <?php
            if ( isset($_POST['btn-change_data']) ) {
              require_once('includes/alert_box.php');
            }
     ?>
      </div>
      <!-- first_row -->
      <div class="col-xs-12 col-md-6">
            <!-- USERNAME -->
            <!--   <h4>User Name:</h4>
              <input type="text" name="username" id="username" class="form-control" placeholder="Enter Username" maxlength="50" value="<?php echo $name ?>" />
              <span class="text-danger"><?php echo $nameError; ?></span> -->

          <!-- FIRSTNAME -->
          <h4 class="color_bc1">First name:</h4>
          <input type="text" id="first_name" name="first_name" class="form-control" value="<?php echo $user_first_name; ?>" placeholder="Enter first name" />
          <span class="text-danger"><?php echo $firstnameError; ?></span>  
          <!-- FAMILYNAME -->
          <h4 class="color_bc1">Family name:</h4>
          <input type="text" id="family_name" name="family_name" class="form-control" value="<?php echo $user_last_name; ?>" placeholder="Enter family name" />
          <span class="text-danger"><?php echo $familynameError; ?></span> 
          <!-- EMAIL -->
          <h4 class="color_bc1">E-Mail:</h4>
          <input type="email" id="email" name="email" class="form-control" value="<?php echo $user_email; ?>" placeholder="Enter Your Email" maxlength="40">
          <span class="text-danger"><?php echo $emailError; ?></span>
           <!-- IBAN -->
          <h4 class="color_bc1">IBAN:</h4>
          <input type="text" id="iban" name="iban" class="form-control" value="<?php echo $user_iban; ?>" placeholder="Enter IBAN" maxlength="34" />
          <span class="text-danger"><?php echo $ibanError; ?></span>
         <!-- Old PASSWORD -->
          <h4 class="color_bc1">Current Password:</h4>
          <input type="password" id="password_old" name="password_old" class="form-control" placeholder="Enter Password"/>
          <span class="text-danger"><?php echo $passError; ?></span>
          
      </div>
      <!-- second row -->
      <div class="col-xs-12 col-md-6">
         <!-- title -->
          <h4 class="color_bc1">Title:</h4>
          <div class="form-group">
  <select class="form-control" value="<?php echo $user_title_id; ?>" id="title" name="title">
          <?php
             // select all available titles
            $res_title=mysqli_query($con, "SELECT * FROM title");
            
            
              while($titleRow=mysqli_fetch_array($res_title)){
                $title = $titleRow['name'];
                $title_id = $titleRow['id'];
                echo "<option value='".$title_id."'>".$title."</option>";
              }
            ?>

  </select>
</div>
          <!-- <span class="text-danger"><?php echo $titlenameError; ?></span>   -->
          <!-- Telephone -->
          <h4 id="telephone_h4" class="color_bc1">Telephone:</h4>
          <input type="text" id="telephone" name="telephone" class="form-control" value="<?php echo $user_telephone; ?>" placeholder="Enter telephone" />
          <span class="text-danger"><?php echo $telephoneError; ?></span> 
          <!-- Year of Birth -->
          <h4 class="color_bc1">Year of Birth</h4>
          <input type="number" id="year" name="year" class="form-control" placeholder="Enter your year of birth" value="<?php echo $user_year; ?>" />
          <span class="text-danger"><?php echo $yearError; ?></span>
          <!-- Country -->
          <h4 class="color_bc1">Current country of residence:</h4>
          <input type="text" id="country" name="country" class="form-control"  placeholder="Enter your current country" />
          <span class="text-danger"><?php echo $countryError; ?></span>

           <!-- NEW PASSWORD -->
          <h4 class="color_bc1">New Password:</h4>
          <input type="password" id="password" name="password" class="form-control" placeholder="Enter Password" maxlength="15" />
          <span class="text-danger"><?php echo $passError; ?></span>
                    
      </div>
      <div class="col-xs-12 text-center">
        <hr>
        <h4 class="color_bc1">Pick an avatar:</h4>
        <hr>

        <?php
          $query_avatar = "SELECT * FROM avatar";
          $res_avatar = mysqli_query($con, $query_avatar);

          while($avatarRow=mysqli_fetch_array($res_avatar)){
            $avatar = $avatarRow['location'];
            $avatar_id = $avatarRow['id'];

            echo    '<label class="radio-inline">
                      <input type="radio" value="'.$avatar_id.'" name="avatar"><img class="img-circle avatar" src="'.$avatar.'" alt="avatar" >
                    </label>';
          }
        ?>
        <div class="text-center text-danger margin-top"><?php echo $avatarError; ?></div>  
      </div>
      <div class="col-xs-12">
        <!-- SUBMIT -->
          <hr />
          <button type="submit" id="btn-change_data" class="btn btn-block btn-primary background_bc1" name="btn-change_data">Change Personal Data</button>
      </div>
      </form>
      </div>
      </div>
      </div>




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