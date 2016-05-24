<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="style/css/bootstrap.min.css">
<script src="style/jquery.min.js"></script>
<script src="style/js/bootstrap.min.js"></script>
<script src="script/jquery.validate.min.js"></script>
<script src="script/additional-methods.js"></script>
<script src="script/validate.js"></script>
<link rel="stylesheet" type="text/css" href="style/style.css">
<title>Registration Page</title>
</head>
<body>
	<%---------- Povratak na index page ukoliko posjetioc nije ulogovan ------------- --%>
	<c:if test="${contact == null || contact.isAdmin == 0 }">
		<c:redirect url="index.jsp" />
	</c:if>
	<%----------------------- Navigation bar -----------------------------------%>

<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#mainNavBar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>

			<a class="navbar-brand"> DENNY ADDRESS BOOK</a>
		</div>
		<div class="collapse navbar-collapse" id="mainNavBar">
			<ul class="nav navbar-nav navbar-right">
				<li>
					<form class="navbar-form navbar-right">
						<a href="home.jsp"><button type="button"
								class="btn btn-default"><span class="glyphicon glyphicon-phone"> </span> &nbsp;About App</button></a>
					</form>
				</li>
			</ul>
		</div>

	</div>
	</nav>
	<%-- ------------------------ End of navigation bar ----------------------------------- --%>

	<div class="container">
		<br /> <br />

		<c:set var="id" scope="session" value="${contact.id }" />

		<c:if test="${errorregistration != null }">
			<div class="alert alert-danger fade in search-field">
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

		<div class="well validation-field">
			
			<form action="RegisterUpdate" method="post" class="form-horizontal"
				id="register" name="register">
				<fieldset>
					<input type="hidden" name="id" value="${contactEdit.id }" />
					<div class="control-group">
						<label class="control-label" for="firstName">First Name</label>
						<div class="controls">
							<input type="text" required id="firstName" name="firstName"
								class="input-xlarge" value="${contactEdit.firstName}" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="lastName">Last Name</label>
						<div class="controls">
							<input type="text" required id="lastName" name="lastName"
								class="input-xlarge" value="${contactEdit.lastName}" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="username">Username</label>
						<div class="controls">
							<input type="text" required id="username" name="username"
								placeholder="" class="input-xlarge"
								value="${contactEdit.username}" />
						</div>
					</div>

					<div class="control-group">
						<!-- Password-->
						<label class="control-label" for="password">Password</label>
						<div class="controls">
							<input type="password" required id="password" name="password"
								placeholder="" class="input-xlarge"
								value="${contactEdit.password}" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="phonenumber">Phone</label>
						<div class="controls">
							<input type="number" required id="phonenumber" name="phoneNumber"
								class="input-xlarge" value="${contactEdit.phoneNumber}" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="address">Address</label>
						<div class="controls">
							<input type="text" required id="address" name="address"
								class="input-xlarge" value="${contactEdit.address}" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="city">City</label>
						<div class="controls">
							<input type="text" required id="city" name="city"
								class="input-xlarge" value="${contactEdit.city}" />
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="role">Role</label>
						<div class="controls">
							<select name="role">
								<c:choose>
									<c:when test="${contactEdit.isAdmin == 1}">
										<option selected value="1">Admin</option>
										<option value="0">User</option>
									</c:when>
									<c:otherwise>
										<option value="1">Admin</option>
										<option selected value="0">User</option>
									</c:otherwise>
								</c:choose>
							</select>
						</div>
					</div>
					<br /> 
					<br />
					<div class="control-group">
						<div class="controls">
							<c:choose>

								<c:when test="${deletion != null }">
									<c:remove var="deletion" scope="session" />
									<button class="btn btn-danger active" type="submit"
										name="button" value="adminDelete" id="submit">Delete</button>
								</c:when>
								<c:when test="${contactEdit != null}">
									<button class="btn btn-success active" type="submit"
										name="button" value="adminUpdate" id="submit">Add</button>
								</c:when>

												<c:when test="${contact != null}">
									<button class="btn btn-success active" type="submit"
										name="button" value="adminRegister" id="submit">Register</button>
								</c:when>

								<c:otherwise>
									<button class="btn btn-success active" type="submit"
										name="button" value="register" id="submit">Sing up</button>
										
								</c:otherwise>
							</c:choose>
							<a href="login.jsp"><button type="button"
											class="btn btn-warning active">Cancel</button></a>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</body>
</html>