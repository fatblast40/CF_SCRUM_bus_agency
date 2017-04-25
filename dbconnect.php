
<?php


 $con = mysqli_connect("localhost","root","","codebus");
 $select = mysqli_select_db($con, 'codebus');

// Check connection
if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }

 ?>
