<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.NoteTaker"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit page : NoteTaker</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
   		<div class = "container">
   			<%@include file="navbar.jsp" %>
          <br>
            <h1>Edit your note here</h1>
            
            <%
            int noteId = Integer.parseInt(request.getParameter("note_id"));
            Session s = FactoryProvider.getFactory().openSession();
            NoteTaker t=(NoteTaker)s.get(NoteTaker.class, noteId);
            
            
            s.close();
             
            %>
            <form action="UpdateServlet" method="post">
            <input value =<%=t.getId() %> name ="noteId" type="hidden"/>
  		<div class="form-group">
  		  <label for="title">Note title</label>
  	  		<input name = "title"
  	  		 required type="text" 
  	  		 class="form-control"
  	  		  id=title aria-describedby="emailHelp" 
  	  		  placeholder="Enter here"'
  	  		  value="<%=t.getTitle() %>"
  	  		  />
    		<small id="emailHelp" class="form-text text-muted">We'll never share your notes with anyone else.</small>
  		</div>
  		<div class="form-group">
    	<label for="content">Note content</label>
    		<textarea required id = "content"
    		 placeholder="Enter your content here"
    		 class = "form-control" style="height: 300px"
    		 name = "content"><%=t.getContent() %></textarea>
    		
    		
  		</div>
  			<div class = "container text-center ">
  			
  			<button type="submit" class="btn btn-success">Save your note</button>
  			
  			</div>
  		
	</form> 
            
        
   
   		</div>
   		


</body>
</html>