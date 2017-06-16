Adding new blog entry

<form name='blog_entry' method='post' action='add_blog_entry.php'>

<table>

	<tr>

		<td>
			Post Name:
			<br/>
			
		</td>
		<td>
			<input type="text" name="post_name" id="post_name" size="30" maxlength="30"> 
			<br/>
			
		</td>
        
    </tr>
    <tr>
       
        <td>
			
			Subject:
			<br/>
			
		</td>
		<td>
			
			<?php dropdown_list('post_subject_id', $default_values=array(NULL, ''), 
				$post_subjects); ?> 
            or add new 
            <input type="text" name="post_subject" id="post_subject" size="30" maxlength="30"> 
			<br/>
            
		</td>
       
    </tr>
    <tr>
       
        <td>
			
			Tags:
			<br/>
		</td>
		<td valign="middle">
			
            <select name="tags" size="1" multiple></select>
            or add new 
			<input type="text" name="post_tags" id="post_tags" size="30" maxlength="30"> 
			<br />
		</td>

	</tr>

<table>

<br/>
<br/>
	
<script type="text/javascript" src="nicEdit_javascript/nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>

<textarea name="post_content" style="width: 500px; height: 200px;">
	My Blog post content
</textarea>
<br />
Make Live:
<br />
<input name="make_live" type="checkbox" value="true" />

<br/>
<br/>

<input type="submit" id="submit" name-"submit" value="Submit"

</form>