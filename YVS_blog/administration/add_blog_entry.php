<?php

require '../functions/db_functions/db_class.php';
require '../functions/html_manipulation_functions/dropdown_list.php';
$db_shit = new DB_class();

session_start();


if ((!isset($_SESSION['user'])) || ($_SESSION['user']=='')){
	
	header('Location:login.php');
	
}
	


switch (true){

	case (isset($_POST['post_name'])):
		
	break;
	
	default:
			
			$post_subjects = $db_shit -> view_all_from_view('yvs_blog_subjects');
			
			$post_tags = $db_shit -> view_all_from_view('yvs_blog_tags');
			
			$menue = 'body/empty.html';
			$message = '';
			$body = 'body/add_blog_entry.php';
			
	break;
}

include "layout/layout.php";
	
?>