<?php 
	/*This functions checks that all the necessary fields 
	are filled in.
	
	An array of the names of the fields in the form must
	be supplied.
	
	The function returns the name of the missing field or
	'false'*/
	function must_exist_fields($must_exist_fields=array()){
		
		$error_fields=array();
		
		foreach ($must_exist_fields as $field){
			
			if (strlen($_POST[$field])==NULL){
			
			//if($_POST[$field]==''){
				
				$error_fields[]=$field;
			}
			
		//necessary fields checked	
		}
		
		if ($error_fields!==NULL){
			
			return $error_fields;
			
		}
		
		else{
			
			return false;
			
		}
		
	}

?>