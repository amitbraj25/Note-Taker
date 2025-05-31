<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Added Notes</title>
	<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class = "container">
   			<%@include file="navbar.jsp" %>
   			<br>
   			<h1>Please fill your note details</h1>
   			<br>
   			    <!-- This is add form -->
	 <form action="SaveNoteServelet" method="post">
  		<div class="form-group">
  		  <label for="title">Note title</label>
  	  		<input name = "title"
  	  		 required type="text" 
  	  		 class="form-control"
  	  		  id=title aria-describedby="emailHelp" 
  	  		  placeholder="Enter here"/>
    		<small id="emailHelp" class="form-text text-muted">We'll never share your notes with anyone else.</small>
  		</div>
  		<div class="form-group">
    	<label for="content">Note content</label>
    		<textarea required id = "content"
    		 placeholder="Enter your content here"
    		 class = "form-control" style="height: 300px"
    		 name = "content"></textarea>
    		
    		
  		</div>
  			<div class = "container text-center ">
  			
  			<button type="submit" class="btn btn-primary">Add</button>
  			
  			</div>
  		
	</form>
   
   		</div> 

</body>
</html>