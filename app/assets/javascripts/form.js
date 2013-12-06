var LoginFormErrors = function(form, errors){
	this.form = form,
	this.errors = errors,

	this.showLoginErrors = function(){
		$(form).on('ajax:error',function(event, xhr, status, error) {
    	$(errors)
    		.html("<div class='small-2 columns alert-box warning radius'>"+ $.parseJSON(xhr.responseText).error + '</div>');
  	});
	}
}

var SignupFormErrors = function(form, errors){
	this.form = form,
	this.errors = errors,

	this.showSignupErrors = function(){
		$(form).on('ajax:error', function(event, xhr, status, error){
			$(errors)
				.html("<div class='small-9 columns alert-box warning radius'><ul class='list'>" +$.parseJSON(xhr.responseText).error+"</ul></div>");
		});
	}
}
 


var LoginErrors = new LoginFormErrors("#login-form", "#login-errors");
var SignupErrors = new SignupFormErrors("#signup-form", "#signup-errors");

$(document).ready(function(){
	LoginErrors.showLoginErrors();
	SignupErrors.showSignupErrors();
});
	


