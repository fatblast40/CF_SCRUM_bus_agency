<?php
	ob_start();
	session_start();
	require_once 'dbconnect.php';

	// if session is not set this will redirect to login page
	if( !isset($_SESSION['admin']) ) {
		header("Location: index.php");
	exit;
	}
	 // select logged-in users detail
	 $res=mysqli_query($con, "SELECT title.name AS title, first_name, last_name, iban, user.id AS user_id, avatar.location AS avatar, avatar.id AS avatar_id FROM user JOIN avatar ON user.avatar_id=avatar.id JOIN payment ON user.id = payment.user_id JOIN title ON user.title_id=title.id WHERE user.id=".$_SESSION['user']);
	 $userRow=mysqli_fetch_array($res);
	 $user_id = $userRow['user_id'];
	 $user_avatar = $userRow['avatar'];
	 $user_last_name = $userRow['last_name'];
	 $user_iban = $userRow['iban'];
	 $user_title = $userRow['title'];


?>