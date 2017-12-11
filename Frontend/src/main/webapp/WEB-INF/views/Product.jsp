<%@ page language="java" contentType="text/html" import="com.niit.model.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
<title>Product</title>
</head>
<body>

<jsp:include page="AdminHeader.jsp"></jsp:include>

<h2><i><center><b>PRODUCT</b></center></i></h2>
 <form:form action="InsertProduct" modelAttribute="product" enctype="multipart/form-data">

<table class="table table-hover">
	
	<table cellspacing="2" align="center">
<tr bgcolor="gray">
	<td>Product ID</td>
	<td>Product Name</td>
	<td>Product Description</td>
	<td>Product Stock</td>
	<td>Product Price</td>
	<td>CatId</td>
	<td>SupId</td> 
	<td>Image</td>
	<td>Operation</td>
</tr>
<c:forEach items="${productList}" var="product">
	<tr bgcolor="">
		<td>${product.productId}</td>
		<td>${product.productName}</td>
		<td>${product.productDesc}</td>
		<td>${product.stock}</td>
		<td>${product.price}</td>
		<td>${product.catName}</td>
		<td>${product.supplierId}</td>

		<td>
			<a href="productDesc/${product.productId}">
			<img src="<c:url value="resources/images/${product.productId}.jpg"/>" width="150px" height="150px">
			</a>
		</td>
		<td>
			<a href="<c:url value="deleteProduct/${product.productId}"/>">DELETE</a>
			<a href="<c:url value="updateProduct/${product.productId}"/>">UPDATE</a>
		</td>
	</tr>
	
</c:forEach>

</table>
 </form:form> 

</body>
</html>