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
<title>Phone App</title>
</head>
<body>
	<%---------- preusmjerenje na index page ako posjetioc nije registrovan ------------- --%>

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


			<!-- Dobrodoslica logovanom korisniku -->

			<a class="navbar-brand"> WELCOME <c:choose>
					<c:when test="${contact != null}">
						<i>${contact.firstName}</i>
					</c:when>

					<c:otherwise>
						<span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
					</c:otherwise>
				</c:choose></a>
		</div>


		<%-------------Pretraga Za Logovanog korisnika ------------------------------- --%>

		<c:if test="${searchContacts != null}">
			<div class="col-sm-3 col-md-6">
				<form class="navbar-form" role="search" action="Search"
					method="post">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search contacts" name="search">
						<div class="input-group-btn">
							<button class="btn btn-success" type="submit" name="button"
								value="registrovaniSearch">
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
					<%-- ------------ Prikaz svih kontakata ----------------- --%>

					<form class="navbar-form" role="search" action="Search"
						method="post">
						<input type="hidden" name="search" value="showAll" />
						<button class="btn btn-default" type="submit" name="button"
							value="registrovaniSearch">
							<span class="glyphicon glyphicon-fone"></span>&#x260E;Contact List
						</button>
					</form>
				</li>
				<%-- ------------ end of  listing all page----------------- --%>

				<li>
					<form class="navbar-form navbar-right">
						<a href="home.jsp"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-phone"> </span> &nbsp;About App</button></a>
					</form>
				</li>
				<li>
					<form class="navbar-form navbar-left" method="post">
						<a href="register.jsp"><button type="button"
								class="btn btn-default"><span class="glyphicon glyphicon-modal-window"> </span> &nbsp;Add Contact</button></a>
					</form>
				</li>
				<li>
					<form class="navbar-form navbar-left" method="post">
                    <button type="button" class="btn btn-default" data-toggle="modal"
							data-target="#registrationPopup">
							<c:choose>
								<c:when test="${ contact != null}">
										<span class="glyphicon glyphicon-edit"> </span> &nbsp;Edit Profile</a>
										</c:when>
								<c:otherwise>
											
                            <span class="glyphicon glyphicon-edit"> </span> &nbsp;Sign Up </a>

										</c:otherwise>
							</c:choose>
						</button>

					</form>
				</li>
				<li>

					<form class="navbar-form navbar-left" method="post">
						<!--  Log In & Log Out -->
						<c:choose>
							<c:when test="${contact != null}">
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#logOutPopup"><span class="glyphicon glyphicon-off"> </span> &nbsp;Log off</button>
								
							</c:when>
							<c:otherwise>
								<button type="button" class="btn btn-default"
									data-toggle="modal" data-target="#logInPopup">Log In</button>
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

		<c:if test="${addmessage != null}">
			<div class="alert alert-success fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<p>${addmessage}</p>
				<c:remove var="addmessage" />
			</div>
		</c:if>
		<c:if test="${errorregistration != null }">
			<div class="alert alert-danger fade in search-field">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<p>${errorregistration}</p>
				<c:remove var="errorregistration" />
			</div>
		</c:if>
		<c:if test="${updateMessage != null }">
			<div class="alert alert-success fade in">
				<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				<p>${updateMessage}</p>
				<c:remove var="updateMessage" />
			</div>
		</c:if>

		<%-- ------------------------Contact List ------------------------ --%>

		<c:choose>
			<c:when test="${searchContacts != null}">
				<br />
				<br />
				<div class="well">
					<div class="table-responsive">
						<form action="RegisterUpdate" method="post">
							<table class="table table-striped">
								<thead>
									<tr class="info">
										<th><input type="radio" name="id" value="0" checked /></th>
										<th>First Name</th>
										<th>Last Name</th>
										<th>Username</th>
										<th>Password</th>
										<th>Phone</th>
										<th>Address</th>
										<th>City</th>
										<th>Role</th>
										<th>Edit</th>
										<th>Delete</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${searchContacts}" var="contacts">
										<tr>
											<c:choose>
												<c:when test="${contacts.id == 1 }">
													<td><input type="radio" name="id"
														value="${contacts.id}" disabled="disabled" /></td>

													<!-- ne dozvoljava adminu da obrise sam sebe -->
												</c:when>
												<c:otherwise>
													<td><input type="radio" name="id"
														value="${contacts.id}" /></td>
												</c:otherwise>
											</c:choose>
											<td><c:out value="${contacts.firstName}" /></td>
											<td><c:out value="${contacts.lastName}" /></td>
											<td><c:out value="${contacts.username }" /></td>
											<td><c:out value="${contacts.password }" /></td>
											<td><c:out value="${contacts.phoneNumber }" /></td>
											<td><c:out value="${contacts.address }" /></td>
											<td><c:out value="${contacts.city }" /></td>
											<td><c:choose>
													<c:when test="${contacts.isAdmin == 1 }">
														<c:out value="Admin" />
													</c:when>
													<c:otherwise>
														<c:out value="User" />
													</c:otherwise>
												</c:choose></td>
											<c:choose>
												<c:when test="${contacts.id == 1 }">
													<td><p data-placement="top" data-toggle="tooltip"
															title="Edit">
															<button disabled="disabled" type="submit" name="button"
																value="adminSelectEdit"
																class="btn btn-primary btn-xs active">
																<span class="glyphicon glyphicon-pencil"></span>
															</button>
														</p></td>
													<td><p data-placement="top" data-toggle="tooltip"
															title="Delete">
															<button disabled="disabled" type="submit" name="button"
																value="adminSelectDelete"
																class="btn btn-danger btn-xs active">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</p></td>
												</c:when>
												<c:otherwise>
													<td><p data-placement="top" data-toggle="tooltip"
															title="Edit">
															<button type="submit" name="button"
																value="adminSelectEdit"
																class="btn btn-primary btn-xs active">
																<span class="glyphicon glyphicon-pencil"></span>
															</button>
														</p></td>
													<td><p data-placement="top" data-toggle="tooltip"
															title="Delete">
															<button type="submit" name="button"
																value="adminSelectDelete"
																class="btn btn-danger btn-xs active">
																<span class="glyphicon glyphicon-trash"></span>
															</button>
														</p></td>
												</c:otherwise>
											</c:choose>

										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</c:when>
			<c:otherwise>

				<br />
				<br />
				<br />
				<%---------------- end error message ------------- --%>

				<%-----------Pretraga kontakata kada je posjetioc logovan ------------- --%>

				<div class="search-field">
					<form role="search" action="Search" method="post">
						<div class="input-group">
							<input type="text" class="form-control" required
								placeholder=" Search contacts" name="search">
							<div class="input-group-btn">
								<button class="btn btn-success" type="submit" name="button"
									value="registrovaniSearch">
									<i class="glyphicon glyphicon-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>

				<%-- --------------   if find error message ----------- --%>
				<c:if test="${errorFind != null}">
					<div class="alert alert-danger fade in search-field">
						<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
						<p>${errorFind}</p>
						<c:remove var="errorFind" scope="session" />
					</div>

				</c:if>
			</c:otherwise>
		</c:choose>
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

			<%-- ---------- Editovanje ulogovanog posjetioca ------------- --%>
		<div class="modal fade" id="registrationPopup">

			<div class="modal-dialog">

				<div class="modal-content">
					<!-- header -->
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h3>Please Register Here</h3>
					</div>
					<!-- body (form) -->
					<div class="modal-header">
						<form action="RegisterUpdate" method="post"
							class="form-horizontal"  id="register" name="register">
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
								<br /> <br />
								<div class="control-group">
									<div class="controls">
										<c:choose>
											<c:when test="${contact != null}">
												<button class="btn btn-success active" type="submit"
													name="button" value="update" id="submit">Update</button>
											</c:when>

											<c:otherwise>
												<button class="btn btn-success active" type="submit"
													name="button" value="register" id="submit">Sing Up</button>

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
		<%-----------------------------------end of edit modal ------------------------------- --%>
		</div>

		
</body>
</html>