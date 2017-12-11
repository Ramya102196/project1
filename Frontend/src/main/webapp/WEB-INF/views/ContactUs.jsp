<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
 <link rel="stylesheet" type="text/css" href="body.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
 <jsp:include page="Header.jsp"></jsp:include>
<div class="container">
<br><br>

<h4>Send Us Message</h4>

<form class="form-horizontal">
 <div class="control-label col-sm-4" >
    <div class="form-group">
     
      
        <input type="text" class="form-control"  placeholder="Enter email" name="email">
      </div>
    
    <div class="form-group">
      
              
        <input type="text" class="form-control" placeholder="Enter mob no" name="mno">
      </div>
    
    <div class="form-group">        
    <textarea class="form-control" placeholder="Messages"></textarea>
      </div>

      
<div class="form-group">        
      <div class="col-sm-1"> 
        <button class="btn btn-default">Send it</button>
      </div>
</div>
</div>
    


  </form>
</div>
</body>
</html>