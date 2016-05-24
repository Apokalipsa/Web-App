<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport"    content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author"      content="Deny Address Book">
  
  <title>Online Telephone App</title>

  <link rel="shortcut icon" href="assets/images/gt_favicon.png">
  
  <!-- Bootstrap itself -->
  <link href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles -->
  <link rel="stylesheet" href="assets/css/magister.css">

  <!-- Fonts -->
  <link href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <link href='http://fonts.googleapis.com/css?family=Wire+One' rel='stylesheet' type='text/css'>
</head>

<!-- use "theme-invert" class on bright backgrounds, also try "text-shadows" class -->
<body class="theme-invert">

<nav class="mainmenu">
  <div class="container">
    <div class="dropdown">
      <button type="button" class="navbar-toggle" data-toggle="dropdown"><span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <!-- <a data-toggle="dropdown" href="#">Dropdown trigger</a> -->
      <ul class="dropdown-menu" role="menu" aria-labelledby="dLabel">
        <li><a href="#head" class="active">Welcome</a></li>
        <li><a href="#about">About app</a></li>
        <li><a href="#themes">Service App</a></li>
        <li><a href="#contact">Get in touch</a></li>
      </ul>
    </div>
  </div>
</nav>


<!-- Main (Home) section -->
<section class="section" id="head">
  <div class="container">

    <div class="row">
      <div class="col-md-10 col-lg-10 col-md-offset-1 col-lg-offset-1 text-center"> 

        <!-- Site Title, your name, HELLO msg, etc. -->
        <h1 class="title">Welcome To </h1>
        <h2 class="subtitle">Deny Address Book</h2>

        <!-- Short introductory (optional) -->
        <h3 class="tagline">
          Welcome in the online telephon servise<br>
          Here you can find your favorite contact and enyoj in conversation.
        </h3>
        
        <!-- Nice place to describe your site in a sentence or two -->
        <p><a href="register.jsp" class="btn btn-default btn-lg">Welcome</a></p>
  
      </div> <!-- /col -->
    </div> <!-- /row -->
  
  </div>
</section>

<!-- Second (About) section -->
<section class="section" id="about">
  <div class="container">
  
    <h2 class="text-center title">About app</h2>
    <div class="row">
      <div class="col-sm-4 col-sm-offset-2">    
        <h5><strong>Web address book<br></strong></h5>
        <p>Well, this application is product of my Buil -it projects, and idea wes that everybody can come here and find his / her favorite contact and call him / her. Its absolutlly free. Just enjoy!
  </div>
  </div>
  </div>


</section>

<!-- Third (Works) section -->
<section class="section" id="themes">
  <div class="container">
  
    <h2 class="text-center title">Service App</h2>
    <p class="lead text-center">
     This App will give you every possability to manipulate with your address.
     Here we are!
    </p>
    <div class="row">
      <div class="col-sm-4 col-sm-offset-2">
        <div class="thumbnail">
          <img src="assets/screenshots/add.jpg" alt="">
          <div class="caption">
            <h3>Create Your Contact</h3>
            <p>If You want add new contact, of cours you can do thet here</p>
            <p><a href="add.html" class="btn btn-primary" role="button">Add</a> <a href="#" class="btn btn-default" role="button">Add</a></p>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="assets/screenshots/list.jpg" alt="">
          <div class="caption">
            <h3>Show all contact list</h3>
            <p>If You just want to see all list of your contacts, do it here</p>
            <p><a href="lista.html" class="btn btn-primary" role="button">Show All</a> <a href="#" class="btn btn-default" role="button">Show All</a></p>
          </div>
        </div>
      </div>
      <div class="col-sm-4 col-sm-offset-2">
        <div class="thumbnail">
          <img src="assets/screenshots/search.jpg" alt="">
          <div class="caption">
            <h3>Search Contacts</h3>
            <p>You wanr to search special contact, just do it here</p>
            <p><a href="#" class="btn btn-primary" role="button">Search</a> <a href="#" class="btn btn-default" role="button">Search</a></p>
          </div>
        </div>
      </div>
      <div class="col-sm-4">
        <div class="thumbnail">
          <img src="assets/screenshots/delete.jpg" alt="">
          <div class="caption">
            <h3>Delete Contacts</h3>
            <p>May You want delete duplicate or unfavorit contact so,do it here</p>
            <p><a href="delite.html" class="btn btn-primary" role="button">Delete</a> <a href="#" class="btn btn-default" role="button">Delete</a></p>
          </div>
        </div>
      </div>

    </div>

  </div>
</section>

<!-- Fourth (Contact) section -->
<section class="section" id="contact">
  <div class="container">
  
    <h2 class="text-center title">Get in touch</h2>

    <div class="row">
      <div class="col-sm-8 col-sm-offset-2 text-center">
        <p class="lead">Have a question about this app, or want to suggest a new feature?</p>
        <p>Feel free to email me</p>
        <p><b>deny.dijana@gmail.com</b><br><br></p>
        <ul class="list-inline list-social">
        
          <li><a href="https://github.com/Apokalipsa" class="btn btn-link"><i class="fa fa-github fa-fw"></i> Github</a></li>
          
        </ul>
      </div>
    </div>

  </div>
</section>


<!-- Load js libs only when the page is loaded. -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script src="assets/js/modernizr.custom.72241.js"></script>
<!-- my scripts -->
<script src="assets/js/magister.js"></script>
</body>
</html>

    