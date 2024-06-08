<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About</title>
<%@include file="components/all_css.jsp"%>
<link rel="stylesheet"  href="components/main.css"/>

<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/jumbotron/">

    <!-- Bootstrap core CSS -->
    <link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="jumbotron.css" rel="stylesheet">
    
</head>
<body>
<%@include file="components/navbar.jsp"%> 

  <main role="main">    
      <div>
        <div  class="container ">
          <h1>Hello, world!</h1>
          <p> Write your thoughts down as they come to you. Notes is a simple to use free note taking app made with Java, Jsp, Servlet & MySql.</p>
          <!-- <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more »</a></p> -->
        </div>
      </div>

      <div class="container ">
        <div class="row">
          <div class="col-md-4">
            <h2>Features</h2>
           <ul>
             <li>Attractive Front Page</li>
             <li>Sign In-Up</li>
             <li>Create Notes</li>
             <li>Update Notes</li>
             <li>Delete Notes</li>
             <li>View Notes</li>
           </ul>
            <!-- <p><a class="btn btn-secondary" href="#" role="button">View details »</a></p> -->
          </div>
          <div class="col-md-4">
            <h2>Tech Stack</h2>
            <ul>
             <li>Java</li>
             <li>Jsp</li>
             <li>Servlet</li>
             <li>Html/Css</li>
             <li>Bootstrap</li>
             <li>Hibernate</li>
             <li>MySql</li>
           </ul>
          </div>
          <div class="col-md-4">
            <h2>Dependencies Used</h2>
            <ul>
             <li>MySql Connector(8.0.33)</li>
             <li>Hibernate ORM(6.4.0)</li>
             <li>Servlet API(1.2)</li>
             <li>JUnit(3.8.1)</li>
           </ul>
          </div>
        </div>

        <hr>

      </div> <!-- /container -->

    </main>

   <%@include file="components/footer.jsp"%>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery-slim.min.js"><\/script>')</script>
    <script src="../../assets/js/vendor/popper.min.js"></script>
    <script src="../../dist/js/bootstrap.min.js"></script>
  


</body>
</html>