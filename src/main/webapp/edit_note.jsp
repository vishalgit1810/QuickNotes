<%@page import="com.entity.Note"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.NoteDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Note</title>

<%@include file="components/all_css.jsp"%>
<link rel="stylesheet"  href="components/main.css"/>

  <style type="text/css">                        /*   shadow diya hai */
   .card-sh{
      box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
   }
 </style> 

</head>
<body>

<c:if test="${empty LoggedUser }">         <!-- // kabhi user loged in nhi hai to redirect karwa dege -->
 
   <c:redirect url="login.jsp"></c:redirect>

</c:if>

<%
int id = Integer.parseInt(request.getParameter("id"));          /* id fectch kar rahe hai */

NoteDao dao= new NoteDao(HibernateUtil.getSessionFactory());
Note ex = dao.getNoteById(id);
%>


	<%@include file="components/navbar.jsp"%>

	<div class="container p-3 container-fluid" >
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card card-sh">
					<div class="class-header text-center">
						<h2 class=" text-center fs-3">Edit Note</h2>  
						
					</div>
					<div class="card-body">
					
						<form action="noteEditServlet" method="get">                     <!--  yaha object se values fetch karke input feild me data show karw rahe hai -->
						
							<div class="mb-3">
                            <label>Title</label> <input type="text" name="title" class="form-control" value="<%=ex.getTitle() %>"/>
                        </div>

                        <div class="mb-3">
                            <label>Date</label> <input type="date" name="date" class="form-control" value="<%=ex.getDate() %>"/>
                        </div>

                        <div class="form-group">
							<label > <h6>Note Content</h6></label>
							<textarea rows="5" cols="" class="form-control"
								placeholder="Enter Your Content" name="description" required="required" ><%=ex.getDescription() %></textarea>
								
						</div>
							
							
							
							<!-- hidden form field technique -->
							<input type="hidden" name="id" value="<%=ex.getId() %>"/>
							
							<button type="submit" class="btn btn-primary col-md-12">Update</button>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>