<%@page import="org.hibernate.SessionFactory"%>
<%@page import="com.db.HibernateUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<%@include file="components/all_css.jsp"%>
<link rel="stylesheet"  href="components/main.css"/>

<style>
  .home-title {
    position: relative; /* Make the container for pseudo-elements relative */
  }

  .home-title::before,
  .home-title::after {
    content: url('img/stars.svg');
    position: absolute;
  }

  .home-title::before {
    left: -50px; /* Adjust the position relative to the h1 tag */
    top: -30px;
  }

  .home-title::after {
    right: -50px; /* Adjust the position relative to the h1 tag */
    bottom: -30px;
  }
  
 /* Apply background styles for the .home class */
  @media (min-width: 1200px) {
    .home {
      background: 
        url('img/human-1.svg') left bottom no-repeat,
        url('img/human-2.svg') right bottom no-repeat,
        url('img/noise-bg.svg') left top repeat,
        var(--background-color);
        background-size: auto 100%;    
    }
  }
</style>



</head>
<body>


<%@include file="components/navbar.jsp"%>


<div class="container py-4 home">
  <main>
    <div class="row text-center justify-content-center ">

      <div class="col-md-10 col-lg-6">
        <h1 class="display-4 fw-bold mb-3 home-title">
          Write your thoughts down as they come to you.
        </h1>
        <p class="fs-5 mb-3">
          Notes is a simple to use free note taking app made with Java, Jsp, Servlet & MySql.
        </p>
        <c:if test="${not empty LoggedUser }">
        <a href="home.jsp" class="btn btn-primary btn-lg">Try Notes, it's FREE!</a>
        </c:if>
         <c:if test="${empty LoggedUser }">
        <a href="login.jsp" class="btn btn-primary btn-lg">Try Notes, it's FREE!</a>
        </c:if>
      </div>

    </div>
  </main>
</div>







</body>
</html>