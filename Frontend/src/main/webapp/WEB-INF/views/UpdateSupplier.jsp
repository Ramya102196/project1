<%@ page language="java" contentType="text/html" import="com.niit.model.Supplier"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<html>
<head>

<title>Supplier Update</title>
<style>

.modal-header, h4, .close {
    background-color: #333;
    color: #fff !important;
    text-align: center;
    font-size: 30px;
}
.modal-header, .modal-body {
    padding: 40px 50px;
}
.nav-tabs li a {
    color: #777;
}
</style>
<title></title>
</head>
<body>
<jsp:include page="AdminHeader.jsp"></jsp:include>
<br>
<br>
<br>
<br>

<form:form action="${pageContext.request.contextPath}//UpdateSupplier" modelAttribute="supplier" method="post">
<table align="center" cellspacing="2">
	<tr>
		<td colspan="2">Supplier Module</td>
	</tr>
	<tr>
		<td>Supplier ID</td>
		<!--<td><input type="text" name="supplierId"/></td>-->
		<td><form:input path="supplierId"/></td>
	</tr>
	<tr>
		<td>Supplier Name</td>
		<!-- <td><input type="text" name="supplierName"/></td> -->
		<td><form:input path="supplierName"/></td>
	</tr>
	<tr>
		<td>Supplier Address</td>
		<!-- <td><input type="text" name="supplierDesc"/></td> -->
		<td><form:input path="supplierAddress"/></td>
	</tr>
	<tr>
		<td colspan="2">
			<center><input type="submit" value="UpdateSupplier"/></center>
		</td>
	</tr>
</table>
</form:form>

<table cellspacing="2" align="center">
<tr bgcolor="gray">
	<td>Supplier ID</td>
	<td>Supplier Name</td>
	<td>Supplier Address</td>
	
</tr>
<c:forEach items="${supplierList}" var="supplier">
	<tr bgcolor="cyan">
		<td>${supplier.supplierId}</td>
		<td>${supplier.supplierName}</td>
		<td>${supplier.supplierAddress}</td>
		
	</tr>
</c:forEach>

</table>

</body>
</html>