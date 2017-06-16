<p>Enter administrator information</p>

<form name="registration_form" method="post" action="register.php">
	<table border="0">
	  <tr>
		<td><strong>User Name: </strong> </td>
		<td><input type="text" name="username" id="username" size="30" maxlength="30" value="<?php echo $username;?>"> 
		  </td>
	  </tr>
      <tr>
		<td><strong>Repeat User Name: </strong> </td>
		<td><input type="text" name="username_2" id="username_2" size="30" maxlength="30" value="<?php echo $username_2;?>"> 
		  </td>
	  </tr>
	  <tr>
		  <td><strong>Password:</strong></td>
		<td><input name="user_password"  id="user_password" type="text" size="30" maxlength="30" value="<?php echo $user_password;?>"> 
		  </td>
	  </tr>
      <tr>
		<td><strong>Repeat Password: </strong> </td>
		<td><input type="text" name="user_password_2" id="user_password_2" size="30" maxlength="30" value="<?php echo $user_password_2;?>"> 
		  </td>
	  </tr>
	  <tr>
		  <td><input name="submit" type="submit" value="Submit"></td>
	  </tr>	  
	</table>
		
</form>
