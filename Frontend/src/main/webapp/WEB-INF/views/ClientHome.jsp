<%@ page language="java" contentType="text/html" import="com.niit.model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<jsp:include page="UserHeader.jsp"></jsp:include>
<div class="carousel-inner">

<div class="item active">
<img class="img-rounded" class="img-responsive center-block"  style="width:100%" src="resources/pet1.jpg"/>
</div>

<div class="item">
<img class="img-rounded" class="img-responsive center-block" style="width:100%" src="resources/pet2.jpg"/>
</div>

<div class="item">
<img class="img-rounded" class="img-responsive center-block"  style="width:100%" src="resources/pet3.jpg"/>
</div>
</div>
<jsp:include page="Footer.jsp"></jsp:include>
</head>
</body>
</html>