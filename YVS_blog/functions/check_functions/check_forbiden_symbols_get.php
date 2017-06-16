<?php 

	/*This function will check all the text fields
	for a possible SQL injection or other programing attack
	
	It takes an array of the IDs for text fields contained
	in the form.
	
	Based on submited array the function reads in the data
	submited by $_POST from the form*/
	
	function check_forbiden_symbols($text_fields=array(), $forbiden_symbols=array()){
		
		
		$error_fields=array();
		
		//check all the fields for forbiden symbols
		foreach ($forbiden_symbols as $symbol){
		
			foreach ($text_fields as $field){
				
				$check_field=$_GET[$field];
				
				if(strpos($check_field,$symbol)!==FALSE)
                {
                       
					$error_fields[]=$field;                
                        
            	}
				               
        	}
		//end of forbiden symbols check	
		}
		
		if ($error_fields!==NULL){
			
			return $error_fields;
			
		}
		
		else{
			
			return false;
			
		}
		
	}

?>