// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "bootstrap"

Rails.start()
Turbolinks.start()
ActiveStorage.start()	

$(document).on("click","#signupsubmit",function(){
  	var email = document.getElementById("user_email").value;
  	var error_email = document.getElementById("error_email");
  	var email_reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})/;

 	var valid = true;
	if(email == "" || email == null)
    {
     error_email.innerHTML = "Please enter email";
                    valid = false;
    } 
    else if((email.match(email_reg)) == null)
    {
    	error_email.innerHTML = "Your email address must be in the format of name@domain.com";
    	valid = false;
    }
    else {
        error_email.innerHTML = "";
    }
	var username = document.getElementById("user_username").value;
	var error_username = document.getElementById("error_username");
    if(username == "" || username == null)
    {
    	error_username.innerHTML = "Please enter username";
        valid = false;
    }
    else
    {
    	error_username.innerHTML = "";
    }
	var password = document.getElementById("user_password").value;
	var error_password = document.getElementById("error_password");
    if(password == "" || password == null)
    {
    	error_password.innerHTML = "Please enter password";
        valid = false;
    }
    else
    {
    	error_password.innerHTML = "";
    }
	var error_password_confirmation= document.getElementById("error_password_confirmation");
	 var user_password_confirmation = document.getElementById("user_password_confirmation").value;
	 if(password != "" && user_password_confirmation == "")
	 {
	 	error_password_confirmation.innerHTML = "Please enter password in Confirm password field";
	 	valid = false;
	 }
	 else
	 {
	 	error_password_confirmation.innerHTML = "";
	 }
    return valid;
});

$(document).on("click","#loginsubmit",function(){
	var email = document.getElementById("user_email").value;
	var password = document.getElementById("user_password").value;
	var error_email = document.getElementById("error_email");
	var error_password = document.getElementById("error_password");
	var email_reg = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})/;
	var valid = true;
	if(email == "" || email == null)
	{
		error_email.innerHTML = "Please enter username";
        valid = false;
	}
	else if((email.match(email_reg)) == null)
    {
    	error_email.innerHTML = "Your email address must be in the format of name@domain.com";
    	valid = false;
    }
	else
	{
		error_email.innerHTML = "";	
	}
	if(password == "" || password == null)
	{
		error_password.innerHTML = "Please enter password";
        valid = false;
	}
	else
	{
		error_password.innerHTML = "";	
	}
	return valid;
});
$(document).on("click", "#forgot-password-submit",function(){
	var email = document.getElementById("user_email").value;
	var error_email = document.getElementById("error_email");
	var valid = true;
	if(email == "" || email == null)
	{
		error_email.innerHTML = "Please enter email"
		valid = false;
	}
	return valid;

});
$(document).on("click","#comment_submit",function(){
	var comment_body = document.getElementById("comment_body").value;
	var error_body = document.getElementById("error_body");
	var valid = true;
	if(comment_body == "" || comment_body == null)
	{
		error_body.innerHTML = "Please add comment";
        valid = false;
	}
	return valid;
});