<%@ page language="java" contentType="text/html" import="com.niit.model.Product" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table, td, th {    
    border: 1px solid #ddd;
    text-align: left;
}

table {
    border-collapse: collapse;
    width: 100%;
}

th, td {
    padding: 15px;
}
/* tr:hover{background-color:#98FB98} */
</style> 
<script>
(function ($) {
    $.fn.extend({
        tableAddCounter: function (options) {

            // set up default options 
            var defaults = {
                title: '#',
                start: 1,
                id: false,
                cssClass: false
            };

            // Overwrite default options with user provided
            var options = $.extend({}, defaults, options);

            return $(this).each(function () {
                // Make sure this is a table tag
                if ($(this).is('table')) {

                    // Add column title unless set to 'false'
                    if (!options.title) options.title = '';
                    $('th:first-child, thead td:first-child', this).each(function () {
                        var tagName = $(this).prop('tagName');
                        $(this).before('<' + tagName + ' rowspan="' + $('thead tr').length + '" class="' + options.cssClass + '" id="' + options.id + '">' + options.title + '</' + tagName + '>');
                    });

                    // Add counter starting counter from 'start'
                    $('tbody td:first-child', this).each(function (i) {
                        $(this).before('<td>' + (options.start + i) + '</td>');
                    });

                }
            });
        }
    });
})(jQuery);

$(document).ready(function () {
    $('.table').tableAddCounter();
    $.getScript("http://code.jquery.com/ui/1.9.2/jquery-ui.js").done(function (script, textStatus) { $('tbody').sortable();$(".alert-info").alert('close');$(".alert-success").show(); });
});

</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf=8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" >
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>

 <jsp:include page="UserHeader.jsp"></jsp:include>
 
 <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-info">
               <center> <h4>Product List.</h4></center></div>
            <div class="alert alert-danger" style="display:none;">
                <span class="glyphicon glyphicon-ok"></span></div>
           



<table class="table table-hover">
	
	<table cellspacing="2" align="center">
<tr bgcolor="gray">
	
	<td>Product Name</td>
	<td>Product Stock</td>
	<td>Price</td>
    <td>CatName</td>
    <td>Image</td>
	
</tr>
<c:forEach items="${productList}" var="product">
	<tr bgcolor="">
		
		<td>${product.productName}</td>
		<td>${product.stock}</td>
		<td>${product.price}</td>
		<td>${product.catName}</td>
		

		<td>
			<a href="productDesc/${product.productId}">
			<img src="<c:url value="resources/images/${product.productId}.jpg"/>" width="100px" height="100px">
			</a>
		</td>
		
	</tr>
	

	
</c:forEach>

</table>
 
</table>
</div>
</div>
</div>

</body>
</html> 


