<%@ Language="javascript" %>

<% 
    var vNew, myConn;
    
    var myConn, sql;

    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb'");

    sql = "UPDATE Messages SET New = False WHERE (Messages.RefMessage = " + Session("refMessage") + ")";
    myConn.Execute(sql);
    myConn.Close();
    
    if(Request.QueryString("flag") == "True")
    {
        Response.Redirect("send.aspx");
    }
    else
    {
        Response.Redirect("read.aspx");
    }
    
%>