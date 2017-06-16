<?php

session_start();


if ((!isset($_SESSION['user'])) || ($_SESSION['user']=='')){
	
	header('Location:login.php');
	
}
	
	$menue = 'body/empty.html';
	$message = 'body/empty.html';
	$body = 'body/index.php';
	

	include "layout/layout.php";
	
?>