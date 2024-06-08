<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.dao.NoteDao"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.entity.*"%>
<%@page import="java.util.List"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Notes</title>

<%@include file="components/all_css.jsp"%>
<link rel="stylesheet"  href="components/main.css"/>

<style type="text/css">
.card-sh {
    box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
}
</style>

</head>
<body>

<c:if test="${empty LoggedUser }">
    <!-- // kabhi user loged in nhi hai to redirect karwa dege -->
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="components/navbar.jsp"%>

<div class="container-fluid">
    <h1 class="text-center">All Notes</h1>
    
    <c:choose>
							<c:when test="${not empty successMsg}">
								<p class="text-center text-success fs-8">${successMsg}</p>
								<c:remove var="successMsg" />

							</c:when>
							<c:otherwise>
								<p class="text-center text-danger fs-8">${failMsg}</p>
								<c:remove var="failMsg" />
							</c:otherwise>
   </c:choose>
    
    <div class="row">
        <div class="col-md-12">
            <%
            
            User user = (User) session.getAttribute("LoggedUser");
            if (user != null) {
			NoteDao dao = new NoteDao(HibernateUtil.getSessionFactory());
			List<Note> list = dao.getallNotes(user);
            
        
             for (Note note : list) {
            %>

            <div class="card mt-3" style="width:800px; margin:0 auto">
            <img alt="" src="img/paper.png" class="card-img-top mt-2 mx-auto"
						style="max-width: 100px">
						
                <div class="card-body p-4">
                    <h5 class="card-title"><%=note.getTitle()%></h5>
                    <p><%=note.getDescription()%></p>
                    <p>
                        <b class="text-success"> Published By : <%=user.getFullName()%></b><br />
                        <b class="text-primary"></b>
                    </p>
                    <p>
                        <b class="text-success"> Published Date : <%=note.getDate()%></b><br />
                        <b class="text-success"></b>
                    </p>
                    <div class="container text-center mt-2">
                        <a	href="noteDeleteServlet?id=<%=note.getId()%>"
										class="btn btn-sm btn-danger me-1">Delete</a>
                      <a href="edit_note.jsp?id=<%=note.getId()%>"
										class="btn btn-sm btn-primary me-1">Edit</a>
                    </div>
                    
                    	
									 
                    
                    
                </div>
            </div>
            <%
                }
            }
            %>
        </div>
    </div>
</div>

</body>
</html>
