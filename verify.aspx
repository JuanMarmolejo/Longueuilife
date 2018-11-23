<%@ Language="javascript" %>

<%
    //Inicializa variables
    var myConn, myRec, user, pwd, sql;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb';Persist Security Info=True");
    myRec = new ActiveXObject("ADODB.Recordset");
    
    user = Request.QueryString("txtuser");
    pwd = Request.QueryString("txtpassword");
    
    sql = "SELECT refUser, Name FROM [Users] WHERE ([User] = '" + user + "') AND ([Password] = '" + pwd + "')";
    myRec.Open(sql, myConn);

    Session("refContact") = undefined;
    Session("Contact") = undefined;
    Session("refMessage") = undefined;
    Session("Message") = undefined;
    
    if(myRec.EOF){
        Session("Error") = "User or Password NOT FOUND. Try Again<br /><br /><br />";
        myRec.Close();
        myConn.Close();
        Response.Redirect("index.aspx");
    }
    else{
        Session("RefMember") = myRec.Fields["refUser"].value;
        Session("MemberName") = myRec.Fields["Name"].value;
        myRec.Close();
        myConn.Close();
        Response.Redirect("welcome.aspx");
    }
    
%>