<%@ Language="javascript" %>

<%
    var myConn, myRec, sql;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb';Persist Security Info=True");
    myRec = new ActiveXObject("ADODB.Recordset");

    if(Session("refContact") == undefined)
    {
        sql = "SELECT [User] FROM Users WHERE (refUser = " + Request.QueryString("rfUser") + ")";
        myRec.Open(sql, myConn);

        Session("refContact") = Request.QueryString("rfUser");
        Session("Contact") = myRec.Fields["User"].Value;
    }
    
    var d = new Date();
    var vDate = d.getDate() + "/" + (d.getMonth() +1) + "/" + d.getFullYear();

    
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

								<!-- Form -->
									<h3>New message</h3>
									<h4>
										To: <span style="color:red; font-weight:bold"><%= Session("Contact") %></span> 	<br />
										Date: <%= vDate %>
									</h4>
									<form method="post" action="sendemail.aspx?rfUser=<%= Request.QueryString("rfUser") %>">
										<div class="row gtr-uniform">
											<div class="col-12 col-12-xsmall">
												<input type="text" name="txtSubject" id="txtSubject" value="" placeholder="Subject" />
											</div>
											<!-- Break -->
											<div class="col-12">
												<textarea name="txtMessage" id="txtMessage" placeholder="Message" rows="6"></textarea>
											</div>
											<!-- Break -->
											<div class="col-12">
												<ul class="actions">
													<li><input type="submit" value="Send" class="primary" /></li>
													<li><input type="reset" value="Clear" /></li>
												</ul>
											</div>
										</div>
									</form>
							
						</div>
						<div class="col-6 col-12-medium">
									<span class="image fit"><img src="images/bajo_el_sol.jpg" alt="" /></span>
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