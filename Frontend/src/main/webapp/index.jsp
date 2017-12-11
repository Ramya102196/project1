<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>

<body>
<jsp:include page="/WEB-INF/views/Header.jsp"></jsp:include>
<div class="container">


<div id="myCarousel" class="carousel slide" data-ride="carousel">
<ol class="carousel-indicators">
<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
<li data-target="#myCarousel" data-slide-to="1" class="active"></li>
<li data-target="#myCarousel" data-slide-to="2" class="active"></li>
<li data-target="#myCarousel" data-slide-to="3" class="active"></li>
</ol>

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
	
<a class="left carousel-control" href="#myCarousel" data-slide="prev">
<span class="glyphicon glyphicon-chevron-left"></span>
<span class="sr-only">Previous</span>
</a>
<a class="right carousel-control" href="#myCarousel" data-slide="next">
<span class="glyphicon glyphicon-chevron-right"></span>
<span class="sr-only">Next</span>
</a>


</div>
</div>
<jsp:include page="/WEB-INF/views/Footer.jsp"></jsp:include>
</body>
</html>
