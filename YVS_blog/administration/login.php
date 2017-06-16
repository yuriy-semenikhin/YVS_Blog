<?php

session_start();

include '../functions/db_functions/db_connect.php';
include '../functions/db_functions/call_stored_procedure.php';
include '../functions/check_functions/check_forbiden_symbols_post.php';

$_SESSION['user']='';

switch (true){
	
	case ((isset($_POST['username'])) && (isset($_POST['user_password']))):
		
		$text_fields=array('username', 'user_password');
		$forbiden_symbols=array('+', '-', '"', '\'', '=', ';', ':');
		
		
		if (check_forbiden_symbols_post($text_fields, $forbiden_symbols)==false){
			
			$required_variables = "'".$_POST['username']."', '".$_POST['user_password']."'";
			$user_check = call_stored_procedure('procedure_login_user', $required_variables);
			
			if ($user_check !== 'absent'){
				
				$_SESSION['user'] = $user_check;
				
				header ('Location:register.php');
					
			}
			
			else{
				
				$menue="body/empty.html";
				$message="<p style='color:red;'>User Doesn't exist. Check name and password.</p>";
				$body='body/login.php';
				
			}
		
		}
		
		else{
			
			$menue="body/empty.html";
			$message="<p style='color:red;'>For your safety these symbols are not allowed for use: <br />
						 + ,  - ,  \" ,  ' ,  = ,  ; ,  :  </p>";
			$body='body/login.php';
			
		}
		
		
	break;
	
	default:
		
		$menue="body/empty.html";
		$message="";
		$body='body/login.php';
		
	break;
	
}


include "layout/layout.php";

?>