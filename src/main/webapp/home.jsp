<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<%@include file="components/all_css.jsp"%>
<link rel="stylesheet"  href="components/main.css"/>

</head>
<body>
<%@include file="components/navbar.jsp"%>

  <c:if test="${empty LoggedUser }">         <!-- // kabhi user loged in nhi hai to redirect karwa dege -->
 
   <c:redirect url="login.jsp"></c:redirect>

</c:if>


<div class="container-fluid container-fluid-custom pb-5 mb-5">
  <div class="row">
    <div class="col-3">
      <img src="img/human-3.svg" alt="Human pointing hand toward a create button">
    </div>
    <div class="col mt-md-4">
      <h2>Okay...</h2>
      <h4>Let's start with your first note!<br/><br/>
        <a href="add_note.jsp">Create one!</a>
      </h4>
    </div>
  </div>
</div>

</body>
</html>