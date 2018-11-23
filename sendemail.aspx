<%@ Language="javascript" %>

<% 

    var vSubject, vMessage;
    vSubject = Request.Form["txtSubject"];
    vMessage = Request.Form["txtMessage"];
    vMessage = vMessage.replace("'", " ");

    var d = new Date();
    var vDate = d.getDate() + "/" + (d.getMonth() +1) + "/" + d.getFullYear();
    
    var myConn, myRec, sql;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb'");

    sql = "INSERT INTO Messages (Title, Message, New, Sender, Receiver, CreationDate) " +
    "VALUES ('" + vSubject + "', '" + vMessage + "', True, " + Session("RefMember") + ", " + Session("refContact") + ", #" + vDate + "#)";

    myConn.Execute(sql);

    Session("refContact") = undefined;
    Session("Contact") = undefined;
    Session("refMessage") = undefined;
    Session("Message") = undefined;

    Response.Redirect("welcome.aspx");
    
    

%>