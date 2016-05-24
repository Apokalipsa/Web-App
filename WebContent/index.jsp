<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style/css/bootstrap.min.css">
<script src="style/jquery.min.js"></script>
<script src="style/js/bootstrap.min.js"></script>
<script src="script/jquery.validate.min.js"></script>
<script src="script/additional-methods.js"></script>
<script src="script/validate.js"></script>
<link rel="stylesheet" type="text/css" href="style/style.css">
<title>Phone Book</title>
</head>
<body>

	<%----------------------- Navigation bar -----------------------------------%>
<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#mainNavBar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<!-- Dobrodoslica korisniku -->
			<a class="navbar-brand"> WELCOME TO DENY ADDRESS BOOK <c:choose>
					<c:when test="${contact != null}">
						<i>${contact.firstName}</i>
					</c:when>

					<c:otherwise>
						<span class="glyphicon glyphicon-eye-open"></span>

					</c:otherwise>
				</c:choose></a>
		</div>


		<%-------------------- Pretraga ne registrovanim posjetiocima ------------------------------- --%>

		<c:if test="${searchContacts != null}">
			<div class="col-sm-3 col-md-6">
				<form class="navbar-form" role="search" action="Search"
					method="post">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search contact" name="search">
						<div class="input-group-btn">
							<button class="btn btn-success" type="submit" name="button"
								value="neRegistrovani">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</c:if>

		<%-------------------- end of nav search ------------------------- --%>

		<div class="collapse navbar-collapse" id="mainNavBar">
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form class="navbar-form navbar-left">
						<a href="home.jsp"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-phone"> </span> &nbsp;About App</button></a>
					</form>
				</li>


					<c:if test="${contact.isAdmin == 1}">
						<form class="navbar-form navbar-left" action="login.jsp"
							method="post">
							<button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-edit"> </span> &nbsp;Admin Page</button>
						</form>
					</c:if>

							<form action="RegisterUpdate"class="navbar-form navbar-left" method="post" >
							
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#registrationPopup">
									<c:choose>
										<c:when test="${ contact != null}">
                             <span class="glyphicon glyphicon-edit"> </span> &nbsp;Edit profile
										</c:when>
										<c:otherwise>
											
                            <span class="glyphicon glyphicon-edit"> </span> &nbsp;Sign Up 

										</c:otherwise>
									</c:choose>
									</button>
			
						</form>
						</li>
						
						<!--  Log In & Log Out  opcija-->

				<li>

					<form class="navbar-form navbar-left" method="post">

						<c:choose>
							<c:when test="${contact != null}">
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#logOutPopup"><span class="glyphicon glyphicon-off"> </span> &nbsp;Log off</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#logInPopup"><span class="glyphicon glyphicon-log-in"> </span> &nbsp;Log in</button>
							</c:otherwise>
						</c:choose>
					</form>


				</li>
			</ul>
		</div>

	</div>
	</nav>
	<%-- ------------------------ End of navigation bar ----------------------------------- --%>

	<%-- ------------------------------Main body ----------------------------- --%>
	<div class="container">


		<%-- --------Rezultat pretrage ne registrovanih posjetioca ------ --%>

		<c:choose>
			<c:when test="${searchContacts != null}">
				<br />
				<br />
				<c:forEach items="${searchContacts}" var="contact">
					<p class="form-wrapper fsize">
						<span class="col-name">First Name:&nbsp;&nbsp;&nbsp;</span><span
							class="col-value"><c:out value="${contact.firstName }" /></span><br />
						<span class="col-name">Last Name:&nbsp;&nbsp;&nbsp;</span><span
							class="col-value"><c:out value="${contact.lastName }" /></span><br />
						<span class="col-name">Phone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
							class="col-value"><c:out value="${contact.phoneNumber }" /></span><br />
						<span class="col-name">Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
							class="col-value"><c:out value="${contact.address }" /></span><br />
						<span class="col-name">City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><span
							class="col-value"><c:out value="${contact.city }" /></span><br />

						<!-- &nbsp = no blank space -->

					</p>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<br />
				<br />
				<br />
				<div class="search-field">
					<form role="search" action="Search" method="post">
						<div class="input-group">
							<input type="text" class="form-control" required
								placeholder=" Search contacts" name="search">
							<div class="input-group-btn">
								<button class="btn btn-success" type="submit" name="button"
									value="neRegistrovani">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<%-- -------------------  poruke upozorenja --------------------- --%>
				<c:if test="${errorFind != null}">
					<div class="alert alert-danger fade in search-field">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<p>${errorFind}</p>
						<c:remove var="errorFind" scope="session" />
					</div>

				</c:if>
			</c:otherwise>
		</c:choose>

		<c:if test="${loginFailed != null}">
			<div class="alert alert-danger fade in search-field">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<p>${loginFailed}</p>
				<c:remove var="loginFailed" scope="session" />
			</div>
		</c:if>

		<c:if test="${addmessage != null}">
			<div class="alert alert-success fade in search-field">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<p>${addmessage}</p>
				<c:remove var="addmessage" scope="session" />
			</div>
		</c:if>
		<c:if test="${errorregistration != null }">
			<div class="alert alert-danger fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<p>${errorregistration}</p>
				<c:remove var="errorregistration" scope="session" />
			</div>
		</c:if>
		<c:if test="${updateMessage != null }">
			<div class="alert alert-success fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<p>${updateMessage}</p>
				<c:remove var="updateMessage" scope="session" />
			</div>
		</c:if>

		<%-- ------------------------End of Search input and result ------------------------ --%>

		<%-- -------------- Log page -------------- --%>

		<div class="modal fade" id="logInPopup">

			<div class="modal-dialog">

				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3>Please Log In</h3>
					</div>

					<div class="modal-header">
						<form role="form" action="LoginHandler" method="post">
							

							<div class="form-group">
							<label class="input-group-addon glyphicon glyphicon-user"></label>
								<input type="text" class="form-control" required
									placeholder="username" name="username" />
									
							</div>

							<div class="form-group">
							<label class="input-group-addon glyphicon glyphicon-lock"></label>
								<input type="password" class="form-control"
									placeholder="password" required name="password" />
									
							</div>
							<button class="btn- btn-success btn-block" type="submit"
								name="button" value="login">Log In</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%----------------------------- end of Log In form ------------------------------------------- --%>

			<%--  ------------------------------ Log Out modal ------------------------------------------- --%>
		<div class="modal fade" id="logOutPopup">


				<div class="modal-dialog ">
    <div class="modal-content">
      <div class="modal-header"><h3> Are you sure you want to log-off ? </h3>
      <div class="modal-body">
  
   
						<form role="form" action="LoginHandler" method="post">
							<button class="btn- btn-success btn-block" type="submit"
								name="button" value="logout">Yes</button>
							<button class="btn- btn-warning btn-block" data-dismiss="modal">Cancel</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%-- -------------------------------- end of log out modal ----------------------------------- --%>

		<%-- ------------- Register Page --------------- --%>
		<div class="modal fade" id="registrationPopup">

			<div class="modal-dialog">

				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3>Please Register Here</h3>
					</div>

					<div class="modal-header">
						<form action="RegisterUpdate" method="post"
							class="form-horizontal"  name="register" id="register">
							<fieldset>

								<div class="control-group">
									<label class="control-label" for="firstName">First Name</label>
									<div class="controls">
										<input type="text" required id="firstName" name="firstName"
											class="input-xlarge" value="${contact.firstName}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="lastName">Last Name</label>
									<div class="controls">
										<input type="text" required id="lastName" name="lastName"
											class="input-xlarge" value="${contact.lastName}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="username">Username</label>
									<div class="controls">
										<input type="text" required id="username" name="username"
											placeholder="" class="input-xlarge"
											value="${contact.username}" />
									</div>
								</div>

								<div class="control-group">
									<!-- Password-->
									<label class="control-label" for="password">Password</label>
									<div class="controls">
										<input type="password" required id="password" name="password"
											placeholder="" class="input-xlarge"
											value="${contact.password}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="phonenumber">Phone</label>
									<div class="controls">
										<input type="number" required id="phonenumber"
											name="phoneNumber" class="input-xlarge"
											value="${contact.phoneNumber}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="address">Address</label>
									<div class="controls">
										<input type="text" required id="address" name="address"
											class="input-xlarge" value="${contact.address}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="city">City</label>
									<div class="controls">
										<input type="text" required id="city" name="city"
											class="input-xlarge" value="${contact.city}" />
									</div>
								</div>
								<br />
								<br />
								<div class="control-group">
									<div class="controls">
										<c:choose>
											<c:when test="${contact != null}">
												<button class="btn btn-success active" type="submit"
													name="button" value="update" id="submit">Update</button>
											</c:when>

											<c:otherwise>
									<button class="btn btn-success active" type="submit"
										name="button" value="register" id="submit">Register</button>
										
								</c:otherwise>
										</c:choose>
										<button type="button" class="btn btn-warning active"
											data-dismiss="modal">Cancel</button>
									</div>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
		<%-----------------------------------end of registration  ------------------------------- --%>


        </div>
		
</body>
</html>