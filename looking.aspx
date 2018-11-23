<%@ Language="javascript" %>

<%

    var myConn, myRec, sql, sqlcities, recCities;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb';Persist Security Info=True");
    myRec = new ActiveXObject("ADODB.Recordset");
    
    sql = "SELECT Sex, Lookingfor FROM Users WHERE (refUser = " + Session("RefMember") + ")";
    myRec.Open(sql, myConn);

    var tmpSex = myRec.Fields["Sex"].Value;
    var tmpLooking = myRec.Fields["Lookingfor"].Value;
    myRec.Close();

    var filterCity = "";
    if (Request.Form("cboCity") != null)
    {
        filterCity = Request.Form("cboCity");
    }
    var filterAge = "";
    if (Request.Form("cboAge") != null)
    {
        filterAge = Request.Form("cboAge");
    }
    var filterRelation = "";
    if (Request.Form("cboRelation") != null)
    {
        filterRelation = Request.Form("cboRelation");
    }

    sql = "SELECT refUser, [User], City, TypeRelationship, BirthDate, AboutMe, Picture FROM Users" +
        " WHERE (Sex = '" + tmpLooking + "') AND (Lookingfor = '" + tmpSex + "')";

    
    if (filterCity != "")
    {
        sql += " AND (City = '" + filterCity + "')";
    }
    if (filterRelation != "")
    {
        sql += " AND (TypeRelationship = '" + filterRelation + "')";
    }
    if (filterAge != "")
    {
        var ageLower = parseInt(filterAge);
        var ageUpper = ageLower + 7;
        if (ageLower == 67)
        {
            sql += " AND DATEDIFF('yyyy', BirthDate, Now()) >= " + ageLower;
        }
        else
        {
            sql += " AND DATEDIFF('yyyy', BirthDate, Now()) BETWEEN " + ageLower + " AND " + ageUpper;
        }
    }

    myRec.Open(sql, myConn);

    sqlcities = "SELECT DISTINCT City FROM Users";
    recCities = new ActiveXObject("ADODB.Recordset");
    recCities.Open(sqlcities, myConn);

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
		<title>Filter Search</title>
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
                        <h3>Filter your search results</h3>
                        <div class="row">


                            <!-- Form -->
									
									<form method="post" action="looking.aspx">
										<div class="row gtr-uniform">
                                            <div class="col-3">
												<select name="cboCity" id="cboCity">
													<option value="">- City -</option>
                                                    <%
                                                        recCities.MoveFirst();
                                                        while(!recCities.EOF){      
                                                    %>
													<option value="<%= recCities.Fields["City"].Value %>""><%= recCities.Fields["City"].Value %></option>
													<%
                                                        recCities.MoveNext();
                                                        }
                                                        recCities.Close();
                                                        %>
												</select>
											</div>
                                            <div class="col-3">
												<select name="cboAge" id="cboAge">
													<option value="">- Age -</option>
													<option value="18">18 - 25</option>
                                                    <option value="25">25 - 32</option>
                                                    <option value="32">32 - 39</option>
                                                    <option value="39">39 - 46</option>
                                                    <option value="46">46 - 53</option>
                                                    <option value="53">53 - 60</option>
                                                    <option value="60">60 - 67</option>
                                                    <option value="67">67 - + </option>
												</select>
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
                                            <div class="col-2">
											    <ul class="actions">
                                                    <li><input type="submit" class="button primary icon fa-search" value="Filter" /></li>
									            </ul>	
											</div>
                                            
										</div>
									</form>
                            <% 
                            
                                if(!myRec.EOF)
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