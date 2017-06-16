<?php

session_start();


if ((!isset($_SESSION['user'])) || ($_SESSION['user']=='')){
	
	header('Location:login.php');
	
}

switch (true){
	
	case(isset($_POST['username'])):
		
		include '../functions/check_functions/registration_checks.php';
		include '../functions/db_functions/db_connect.php';
		include '../functions/db_functions/call_stored_procedure.php';
		
		$username = $_POST['username'];
		$user_password = $_POST['user_password'];
		$username_2 = $_POST['username_2'];
		$user_password_2 = $_POST['user_password_2'];
		
		$return = array();
		$error_fields = array();
		$error_message = '';
		
		if (($return = registration_checks()) != false){
			
			$error_message = $return[0];
			$error_fields = $return[1];
			
			echo $error_message .'</br>';
			
			print_r ($error_fields); 
		}
		
		else{
			
			$required_variables = "'".$username."', '".$user_password."'";
			
			$new_user = call_stored_procedure('procedure_add_user', $required_variables);
			
			if ($new_user == 'exists'){
				
				$message = 'This username already exists';
				
			}
			
			else{
				
				$message = 'New User ID: '.$new_user;
				
			}
			
			
			echo $message;
			
		}
		
		include "body/register.php";
		
	break;
	
	default:
		
		$username = 'Username';
		$user_password = 'User Password';
		$username_2 = 'Repeat Username';
		$user_password_2 = 'Repeat User Password';
		
		include "body/register.php";
		
	break;
	
}

?>