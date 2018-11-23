<%@ Language="javascript" %>

<%
    var vUser, vPassword, vName, vEmail, vCity, vRelation, vBirth, vSex, vLooking, vAbout;
    vUser = Request.Form["txtUser"];
    vPassword = Request.Form["txtPassword"];
    vName = Request.Form["txtName"];
    vEmail = Request.Form["txtEmail"];
    vCity = Request.Form["txtCity"];
    vRelation = Request.Form["cboRelation"];
    vBirth = Request.Form["txtBirth"];
    vSex =  Request.Form["cboSex"];
    vLooking = Request.Form["cboLooking"];
    vAbout =  Request.Form["txtAbout"];
    vAbout = vAbout.replace("'", " ");

    var myConn, myRec, sql;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb'");

    sql = "SELECT [User] FROM Users WHERE (Email = '" + vEmail + "')";

    myRec = new ActiveXObject("ADODB.Recordset");
    myRec.Open(sql, myConn);

    if(myRec.EOF)
    {
        var vImagen;
        if(vSex == "Man")
        {
            vImagen = "man.jpg";
        }
        else
        {
            vImagen = "woman.jpg";
        }
    
        sql = "INSERT INTO Users ([User], [Password], Name, Sex, Lookingfor, City, TypeRelationship, BirthDate," +
        " Email, AboutMe, Picture) VALUES ('" + vUser + "', '" + vPassword + "', '" + vName + "', '" + vSex + "', '" + vLooking + 
        "', '" + vCity + "', '" + vRelation + "', #" + vBirth + "#, '" + vEmail + "', '" + vAbout + "', '" + vImagen + "')";
        myConn.Execute(sql);
        Response.Redirect("index.aspx");
    }
    else
    {
        Session("Error") = "EL USUARIO YA EXISTE";
        Response.Redirect("registration.aspx");
    }
    
    
%>


<html>
<head>
    <title></title>
</head>
<body>
    
</body>
</html>
