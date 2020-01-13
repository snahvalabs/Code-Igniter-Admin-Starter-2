/**
 * @author Kishor Mali
 */


jQuery(document).ready(function(){
	
	jQuery(document).on("click", ".deleteContact", function(){
		var contactId = $(this).data("contactid"),
			hitURL = baseURL + "contact/deleteContact",
			currentRow = $(this);
		
		var confirmation = confirm("Are you sure to delete this contact ?");
		
		if(confirmation)
		{
			jQuery.ajax({
			type : "POST",
			dataType : "json",
			url : hitURL,
			data : { contactId : contactId } 
			}).done(function(data){
				console.log(data);
				currentRow.parents('tr').remove();
				if(data.status = true) { alert("Contact successfully deleted"); }
				else if(data.status = false) { alert("Contact deletion failed"); }
				else { alert("Access denied..!"); }
			});
		}
	});
	
	
	jQuery(document).on("click", ".searchList", function(){
		
	});
	
});
