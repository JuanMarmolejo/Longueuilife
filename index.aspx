<%@ Language="javascript" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : WellFormed 
Description: A two-column, fixed-width design with dark color scheme.
Version    : 1.0
Released   : 20130731

-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LongueuiLife - Login Page</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" type="text/css" href="css/popup.css">
<link rel="stylesheet" type="text/css" href="css/stylesheet.css">
<link rel="stylesheet" type="text/css" href="css/elements.css">



<!--[if IE 6]><link href="default_ie6.css" rel="stylesheet" type="text/css" /><![endif]-->

</head>
<body>
<div id="logo" class="container">
	<h1><a href="#">Longueui<span>Life</span></a></h1>
	<p>MARMOL<a href="#" rel="nofollow">SOFT</a></p>
</div>

<div id="banner" class="container"> <img src="images/parejas.jpg" width="1200" height="500" alt="" /></div>
<div id="bannertext">
	<h3><strong><%= Session("Error") %>LongueuiLife</strong> is the best online dating site for longueuil</h3>
</div>

<div id="btnSignup">
	<a href="registration.aspx" class="button">SIGN IN</a>
</div>
<div id="btnLogin">
	<a href="#popup" class="button">LOGIN</a>
</div>

<!--- Pop-Up -->
        <div class="modal-wrapper" id="popup">
            <div class="popup-contenedor">
               <form action="verify.aspx" method="get">
                   <h2 style="color: #BB1717">LOGIN</h2>
                   <div class="col-6 col-12-xsmall">
                        <input type="text" name="txtuser" id="name" value="" placeholder="User" />
                      </div><br \>
                      <div class="col-6 col-12-xsmall">
                        <input type="password" name="txtpassword" id="password" value="" placeholder="Password" />
                      </div>
                   <div><br \><br \>
                       <a href="registration.aspx">Do not have a user account? Register</a>    
                   </div><br \>
                   <input type="submit" class="button special small" name="btnEnter" value="Entrar">
                   <a class="popup-cerrar" href="#">X</a>
               </form>
            </div>
        </div>
    <% Session("Error") = "" %>
</body>
</html>
