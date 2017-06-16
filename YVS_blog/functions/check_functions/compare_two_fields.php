<?php 
	/*This functions checks that if two fields are equal to each 
	other. it can be used when one is comparing emails or passwords
	so that the user does not make a mistake
	
	An array of the names of the fields in the form must
	be supplied.
	
	The function returns 'false' if the fields are equal*/
	
	function compare_two_fields($fields=array()){
		
		$field1=$_POST[$fields[0]];
		$field2=$_POST[$fields[1]];
		
		if($field1!==$field2){
				
			return $fields;
				
		}
		
		else{
			
			return false;
			
		}
					
	}

?>