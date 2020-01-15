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
	
	var addUserForm = $("#doTransfer");
	
	var validator = doTransferForm.validate({
		
		rules:{
			nominal :{ required : true, digits : true }
		},
		messages:{
			nominal :{ required : "This field is required", digits : "Please enter numbers only" }		
		}
	});
});
