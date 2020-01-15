/**
 * File : addUser.js
 * 
 * This file contain the validation of add user form
 * 
 * Using validation plugin : jquery.validate.js
 * 
 * @author Kishor Mali
 */

$(document).ready(function(){
	
	var addUserForm = $("#doTopup");
	
	var validator = doTopupForm.validate({
		
		rules:{
			code :{ required : true, digits : true }
		},
		messages:{
			code :{ required : "This field is required", digits : "Please enter numbers only" }		
		}
	});
});
