<%@ Language="javascript" %>

    
    
    


<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Registration Page</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="assets/css/main.css" />
        <link rel="stylesheet" type="text/css" href="css/popup.css">

        <script type="text/javascript" src="js/functions.js"></script>


	</head>
	<body class="is-preload">
        
		<!-- Header -->
			<header id="header">
				<a class="logo" href="index.html">MARMOL<strong>SOFT</strong></a>
			</header>

		<!-- Heading -->
			<div id="heading" >
				<h1>New User Registration</h1>
			</div>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">
                        <h3><%= Session("Error") %></h3>
					<!-- Elements -->
						<div class="row">
							<div class="col-12 col-12-medium">
								<!-- Form -->
									<h3>Create your profile</h3>
									<form method="post" action="registerDB.aspx" onsubmit="return valregistration()">
										<div class="row gtr-uniform">
											<div class="col-6 col-12-xsmall">
												<input type="text" name="txtUser" id="txtUser" value="" placeholder="User" />
											</div>
											<div class="col-6 col-12-xsmall">
												<input type="password" name="txtPassword" id="txtPassword" value="" placeholder="Password" />
											</div>

                                            <div class="col-6 col-12-xsmall">
												<input type="text" name="txtName" id="txtName" value="" placeholder="Full name" />
											</div>

                                            <div class="col-6 col-12-xsmall">
												<input type="email" name="txtEmail" id="txtEmail" value="" placeholder="Email" />
											</div>

                                            <div class="col-4 col-12-xsmall">
												<input type="text" name="txtCity" id="txtCity" value="" placeholder="City" />
											</div>

                                            <div class="col-4">
												<select name="cboRelation" id="cboRelation">
													<option value="">- Type of relationship -</option>
													<option value="Anyone">Anyone</option>
													<option value="Friendship">Friendship</option>
                                                    <option value="Marriage">Marriage</option>
                                                    <option value="Pen pal">Pen pal</option>
                                                    <option value="Romance">Romance</option>
												</select>
											</div>

                                            <div class="col-4 col-12-xsmall">
												<input type="text" name="txtBirth" id="txtBirth" value="" placeholder="Birthdate (yyyy-mm-dd)" />
											</div>

											<!-- Break -->
											<div class="col-6">
												<select name="cboSex" id="cboSex">
													<option value="">- I'm a ... -</option>
													<option value="Man">Man</option>
													<option value="Woman">Woman</option>
												</select>
											</div>

                                            <div class="col-6">
												<select name="cboLooking" id="cboLooking">
													<option value="">- I am looking for a ... -</option>
													<option value="Man">Man</option>
													<option value="Woman">Woman</option>
												</select>
											</div>
											
											<!-- Break -->
											<div class="col-12">
												<textarea name="txtAbout" id="txtAbout" placeholder="About me" rows="6"></textarea>
											</div>
											<!-- Break -->
											<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="Submit Form" class="primary" /></li>
													<li><input type="reset" value="Reset" /></li>
												</ul>
											</div>
										</div>
									</form>
							</div>
						</div>
					</div>
				</div>
			</section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
        <%Session("Error") = ""; %>

	</body>
</html>