<?php

function registration_checks(){
	
	include '../functions/check_functions/check_text_fields.php';
	include '../functions/check_functions/must_exist_fields.php';
	include '../functions/check_functions/compare_two_fields.php';
	
	$forbiden_symbols = array('+', '-', '"', '\'', '=', ';', ':');
	$fields = array('username', 'username_2', 'user_password', 'user_password_2');
	$usernames = array('username', 'username_2');
	$passwords = array('user_password', 'user_password_2');
	
	$error_fields = array();
	$return = array();
	
	if (($error_fields = must_exist_fields($fields))!=false){
		
		$return[0] = 'You need to fill out all the fields';
		$return[1] = $error_fields;
		
		//echo $return[0];
		
	}
	
	elseif (($error_fields = check_text_fields($fields, $forbiden_symbols)) != false){
		
		$return[0] = 'You used one of these symbols "+" "-" "\"" "\\" "=" ";" ":" that could be used in hacking attacks';
		$return[1] = $error_fields;
		
		//echo $return[0];
		
	}
	
	elseif (($error_fields = compare_two_fields($usernames)) != false){
		
		$return[0] = 'Check username and try again';
		$return[1] = $error_fields;
		
		//echo $return[0];
		
	}
	
	elseif (($error_fields = compare_two_fields($passwords)) != false){
		
		$return[0] = 'Check password and try again';
		$return[1] = $error_fields;
		
		//echo $return[0];
		
	}
	
	else{
		
		$return = false;	
		
	}
	
	return $return;
}

?>