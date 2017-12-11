 <%@ page language="java" contentType="text/html" import="com.niit.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
<head>  

<title>Web App</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf=8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"  >
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" language="javascript">
function formValidation()  
{  
var passid = document.registration.userPassword;  
var uname = document.registration.UserName;  
var uadd = document.registration.userAddress;    
var uemail = document.registration.userEmail;  
var uphone=document.registration.userPhone;

if(allLetter(uname))  
{  
if(ValidateEmail(uemail)) 
{
if(passid_validation(passid,7,12)) 
{   
if(phonenumber(uphone))
{
if(alphabetic(uadd))  
{   
}
}  
}   
}  
}   
 
return false;  
} 


function passid_validation(passid,mx,my)  
{  
var passid_len = passid.value.length;  
if (passid_len == 0 ||passid_len >= my || passid_len < mx)  
{  
alert("Password should not be empty / length be between "+mx+" to "+my);  
passid.focus();  
return false;  
}  
return true;  
}  
function allLetter(uname)  
{   
var letters = /^[A-Za-z]+$/;  
if(uname.value.match(letters))  
{  
return true;  
}  
else  
{  
alert('Username must have alphabet characters only');  
uname.focus();  
return false;  
}  
}  
function alphabetic(uadd)  
{   
var letters = /^[A-Za-z]+$/; 
if(uadd.value.match(letters))  
{  
alert('Form Succesfully Submitted');  
window.location.reload()  
return true;  
}  
else  
{  
alert('User address must have alphabetic characters only');  
uadd.focus();  
return false;  
}  
}  

function phonenumber(uphone)  
{  
  var phoneno = /^\d{10}$/;  
  if((uphone.value.match(phoneno)))
        {  
      return true;  
        }  
      else  
        {  
        alert("UserPhoneNo must have numeric characters only");  
        return false;  
        }  
}  
  
function ValidateEmail(uemail)  
{  
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;  
if(uemail.value.match(mailformat))  
{  
return true;  
}  
else  
{  
alert(" Empty/Invalid email address!");  
uemail.focus();  
return false;  
}  
} 

</script> 
</head>
<body onload="document.registration.userid.focus();">

<jsp:include page="Header.jsp"></jsp:include>
<div class="container">
<form:form name="registration" onSubmit="return formValidation();">
<form:form action="AddUser" modelAttribute="user">

<div class="col-lg-12">
<center>
<h3> REGISTER FORM</h3>
</center>
<div class="col-lg-10">
<div class="row">

        
<div class="form-group">
<div class="input-group">
<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
<input name="UserName" class="form-control" placeholder="Enter the username" />
</div>
</div>
<div class="form-group">
<div class="input-group">
<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
<input name="userPassword" class="login-field  login-field-password form-control input-mg" name="password-2" id="password-2" type="password" placeholder="Enter the password" />

                    	</div>
                    	</div>
<div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-envelope"></span></span>
                            <input name="userEmail" class="form-control" placeholder="Enter the EmailId"  />
                        </div>
                    	</div>
                    
                    	<div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-home"></span></span>
                            <input name="userAddress" class="form-control" placeholder="Enter the address"  />
                            
                        </div>
                    	</div> 
                    
                    	<div class="form-group">
                        <div class="input-group">
                            <span class="input-group-addon"><span class="glyphicon glyphicon-phone-alt"></span></span>
                            <input name="userPhone" class="form-control" placeholder="Enter the PhoneNo" />
                        </div>
                    	</div> 
                    
             
             <%-- <center><input type="submit" value="Insert"/></center> --%>
<center>
<button type="submit" class="btn btn-lg btn-info"  value="Submit">Submit</button> 


	<button type="reset"  class="btn btn-lg btn-info">Cancel</button>
	
	</center>
	
	
 </div>  
 </div>
 </div>         
 </form:form>               
</form:form>
</div>  



<jsp:include page="Footer.jsp"></jsp:include>

</body>
</html> 