<%@ Language="javascript" %>

<%

    var myConn, myRec, recMember, sql, refMember;

    refMember = Session("RefMember");
    

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb';Persist Security Info=True");
    myRec = new ActiveXObject("ADODB.Recordset");

    sql = "SELECT Messages.RefMessage, Messages.Title, Messages.New, Messages.Sender, Messages.Receiver, Messages.CreationDate, Users.[User], Users.refUser " +
            "FROM (Messages INNER JOIN Users ON Messages.Sender = Users.refUser) " + 
            "WHERE Messages.Receiver = " + refMember;
  
    myRec.Open(sql, myConn);

%>


<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Message Page</title>
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
							<div class="col-12 col-12-medium">

								

								<!-- Table -->
									<div class="table-wrapper">
										<table>
                                             <%
            if(myRec.EOF){ %>
                <h3>No messages in your inbox</h3>"
            <% 
            }
            else{%>
											<thead>
												<tr>
													<th></th>
													<th>Date</th>
													<th>Sender</th>
													<th>Subject</th>
													<th colspan="2">Actions</th>
												</tr>
											</thead>
                                            <% myRec.MoveFirst();
                                            while(!myRec.EOF){  %>
											<tbody>
                                                <% if(myRec.Fields["New"].value){ %>
												<tr style="background-color: #FBB093">
                                                    <td><img src='images/cvir_msgi_msg_new.gif'></td>
                                                <% }
                                                   else { %>
                                                        <tr>
                                                            <td><img src='images/cvir_msgi_msg_lu.gif'></td>
                                                    <% } %>
													<td><%= myRec.Fields["CreationDate"].Value %></td>
													<td><%= myRec.Fields["User"].Value %></td>
													<td><%= myRec.Fields["Title"].Value %></td>
													<td><a href="readmsg.aspx?rfMes=<%= myRec.Fields["RefMessage"].Value %>">Read</a></td>
													<td><a href="deletemsg.aspx?rfMes=<%= myRec.Fields["RefMessage"].Value %>">Delete</a></td>
												</tr>
                                                <%
                    myRec.MoveNext();
                }
            }
            myRec.Close();
            myConn.Close();
            %>
											</tbody>
										</table>
									</div>
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