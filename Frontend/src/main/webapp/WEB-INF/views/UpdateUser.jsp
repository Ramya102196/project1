<%@ page language="java" contentType="text/html" import="com.niit.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="UserHeader.jsp"></jsp:include>
<br>
<br>
<br>
<div class="container">
<div class="jumbotron">
<h1>Account</h1>
<div class="col-lg-12">
<div class="row">


<form:form action="${pageContext.request.contextPath}//updateUser" modelAttribute="user" method="post"> 
<div class="col-lg-8">
	
	
	<div class="form-group">
	
	<label>Choose your username</label>
	<form:input path="userName" placeholder="Enter UserName..." class="form-control"/>
	
	</div>
	
	<div class="form-group">
	
	<label>Email-ID</label>
	<form:input path="userEmail" type="email" placeholder="someone@example.com" class="form-control"/>
	
	</div>
	<div class="form-group">
	
	<label>Create a Password</label>
	<form:input type="password" path="userPassword" placeholder="Enter password " class="form-control"/>
	
	</div>
	
	
	<div class="form-group">
	
	<label>Phone Number</label>
	<form:input path="userPhone" placeholder="Enter phone number " class="form-control"/>
	
	</div>

	<div class="form-group">
	
	<label>Address</label>
	<form:input path="userAddress" placeholder="Enter Address..." class="form-control" rows="5"></form:input>
	
	</div>
	<br>
	<br>
	<center>
	<button type="UpdateUser" class="btn btn-lg btn-info">Update</button>
	
	</center>
	
</div>

</form:form>
</div>
</div>
</div>
</div>

</body>
</html>