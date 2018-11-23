<%@ Language="javascript" %>

<%

    var myConn, myRec, sql;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb';Persist Security Info=True");
    myRec = new ActiveXObject("ADODB.Recordset");
    
    sql = "SELECT Sex, Lookingfor FROM Users WHERE (refUser = " + Session("RefMember") + ")";
    myRec.Open(sql, myConn);

    var tmpSex = myRec.Fields["Sex"].Value;
    var tmpLooking = myRec.Fields["Lookingfor"].Value;
    myRec.Close();
    sql = "SELECT refUser, [User], City, TypeRelationship, BirthDate, AboutMe, Picture FROM Users" +
        " WHERE (Sex = '" + tmpLooking + "') AND (Lookingfor = '" + tmpSex + "')";
    myRec.Open(sql, myConn);

    function calculateAge(vDate) {
        var today = new Date();
        var birthday = new Date(vDate);
        var age = today.getFullYear() - birthday.getFullYear();
        var m = today.getMonth() - birthday.getMonth();

        if (m < 0 || (m === 0 && today.getDate() < birthday.getDate())) {
            age--;
        }

        return age;
    }

    
%>

<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Welcome Page</title>
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
                        <div class="row">
                            <% 
                            
                                myRec.MoveFirst();
                                while(!myRec.EOF){
                                var vImg = "images/" + myRec.Fields["Picture"].Value;
                                %>                        
                            <div class="col-4 col-12-medium">
                            	<p>
                            		<span class="image left"><img src="<%= vImg %>" alt="" /></span>
                            		<dt><strong>User: </strong><%= myRec.Fields["User"].Value %></dt> 
                            		<dt><strong>City: </strong><%= myRec.Fields["City"].Value %></dt>
                            		<dt><strong>Type Relationship: </strong><%= myRec.Fields["TypeRelationship"].Value %></dt>
                            		<dt><strong>Age: </strong><%= calculateAge(myRec.Fields["BirthDate"].Value) %></dt> 
                            		<dt><strong>Description: </strong><%= myRec.Fields["AboutMe"].Value %></dt>
                            	</p>
                            	<ul class="actions fit">
										<li><a href="send.aspx?rtn=1&rfUser=<%= myRec.Fields["refUser"].Value %>" class="button primary fit small">Send Message</a></li>
									</ul>
                            </div>
                            <% 
                                myRec.MoveNext();
                                } %>
                            
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