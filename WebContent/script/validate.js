$(document).ready(function(){
 
 $('#register').validate(
 {
  rules: {
    firstName: {
      minlength: 3,
      required: true,
      lettersonly: true
    },
    lastName: {
      minlength: 3,
      required: true,
      lettersonly: true
    },
    username: {
    	minlength: 4,
    	required: true,
    	alphanumeric: true
    },
    password: {
      minlength: 4,
      required: true,
      alphanumeric: true
    },
    
    phoneNumber: {
        minlength: 9,
        required: true
      },
    
    address: {
    	minlength: 3,
    	required: true,
    	address: true
    },
    
    city: {
    	minlength: 3,
    	required: true,
    	city: true
    }
  },
  messages: {
        firstName: {
        	required: "Please enter your first name",
        	minlength: "First name must be at least 3 characthers long",
        	lettersonly: "Only letters are alowed"
        },
        lastName: {
        	required: "Please enter your last name",
        	minlength: "Last name must be at least 3 characthers long",
        	lettersonly: "Only letters are alowed"
        },
        password: {
            required: "Please provide a password",
            minlength: "Your password must be at least 4 characters long",
            alphanumeric: "Only letters and numbers allowed"
        },
        username : {
        	required: "Please provide a username",
        	minlength: "Username must be at least 4 characthers long",
        	alphanumeric: "Only letters and numbers allowed"
        },
        phoneNumber: {
        	requered: "Please provide phone number",
        	minlength: "Phone number must be at least 9 digits long"
        },
        address: {
        	required: "Please provide your address",
        	minlength: "Address must be at least 3 characters long",
        	address: "Only letters, numbers, /, -, _ are allowed"
        },
        
        city: {
        	required: "Please provide your city name",
        	minlength: "City name must be at least 3 characters long",
        	city: "Only letters and spaces are alowed"
        }
        
  		
  },
  highlight: function(element) {
    $(element).closest('.form-group').removeClass('success').addClass('error');
  },
  success: function(element) {
    element
    .text('OK!').addClass('valid')
    .closest('.form-group').removeClass('error').addClass('success');
  }
 });
});