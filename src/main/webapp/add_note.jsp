<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Note</title>
    <%@include file="components/all_css.jsp"%>
    <link rel="stylesheet"  href="components/main.css"/>
  <style type="text/css">
        .card-sh{
            box-shadow: 0 0 6px 0 rgba(0, 0, 0, 0.3);
        }
    </style> 
</head>

<body >
<c:if test="${empty LoggedUser }">         
    <c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="components/navbar.jsp"%>

<div class="container p-3">
    <div class="row">
        <div class="col-md-4 offset-md-4">
            <div class="card card-sh">
                <div class="class-header text-center">
                    <h2 class=" text-center fs-3">Add Note</h2>                        
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
                </div>
                <div class="card-body">
                    <form action="addNoteServlet" method="post">
                        <div class="mb-3">
                            <label>Title</label> <input type="text" name="title" class="form-control" />
                        </div>

                        <div class="mb-3">
                            <label>Date</label> <input type="date" name="date" class="form-control" />
                        </div>

                        <div class="form-group">
							<label for="exampleInputEmail1"> <h6>Note Content</h6></label>
							<textarea rows="5" cols="" class="form-control"
								placeholder="Enter Your Content" name="description" required="required"></textarea>
								
						</div>

                        <button type="submit" class="btn btn-primary col-md-12">Add</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
