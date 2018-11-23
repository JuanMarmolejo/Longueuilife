<%@ Language="javascript" %>

<%

    Session("refMessage") = Request.QueryString["rfMes"];

    var myConn, myRec, sql;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb';Persist Security Info=True");
    myRec = new ActiveXObject("ADODB.Recordset");

    sql = "SELECT Messages.Title, Messages.Message, Messages.CreationDate, Users.refUser, Users.[User] " +
        "FROM (Messages INNER JOIN Users ON Messages.Sender = Users.refUser) " +
        "WHERE (Messages.RefMessage = " + Session("refMessage") + ")";
    
    myRec.Open(sql, myConn);

    Session("refContact") = myRec.Fields["refUser"].Value;
    Session("Contact") = myRec.Fields["User"].Value;
    
%>

<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Reading message</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body class="is-preload">

        <!-- Header -->
			<header id="header">
				<a class="logo" href="#">MARMOL<strong>SOFT</strong></a>
				<nav>
					<a href="#menu">Menu</a>
				</nav>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="read.aspx">My messages</a></li>
					<li><a href="looking.aspx">Look for a couple</a></li>
                    <li><a href="index.aspx">Sign off</a></li>
				</ul>
			</nav>

		<!-- Heading -->
			<div id="heading" >
				<h1><%= Session("MemberName") %></h1>
			</div>

		<!-- Main -->
			<section id="main" class="wrapper">
				<div class="inner">
					<div class="content">

					<!-- Elements -->
						<div class="row">
							<div class="col-6 col-12-medium">
									<span class="image fit"><img src="images/Felices.jpg" alt="" /></span>
							</div>
							<div class="col-6 col-12-medium">

								
								<!-- Tabla de prueba-->

								<table id="tblRead" style="border-spacing: 10px;">
										<tr>
											<td>
                                               From: <span style="color: #E2212F; font-weight: bold;"><%= Session("Contact") %></span> <br />
												<%= myRec.Fields["CreationDate"].Value %> <br />
												<span style="color: #E2212F; font-weight: bold;"><%= myRec.Fields["Title"].Value %></span>
											</td>
										</tr>
										<tr>
											<td style="height: 150px; border: 1px solid; background-color: white; vertical-align: top" colspan="2"><%= myRec.Fields["Message"].Value %></td>
										</tr>
									</table>
								<!-- Buttons -->
									
									<ul class="actions">
										<li><a href="updateread.aspx?flag=True" class="button primary">Answer</a></li>
										<li><a href="updateread.aspx?flag=False" class="button primary">Return</a></li>
										
									</ul>


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

	</body>
</html>