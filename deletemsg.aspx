<%@ Language="javascript" %>

<% 
    var sql, refM, myConn; 
    
    refM = Request.QueryString("rfMes");
    
    myConn = new ActiveXObject("ADODB.Connection");
    myConn.Open("Provider=Microsoft.Jet.OLEDB.4.0;Data Source='C:\\Users\\Juan Carlos\\source\\WebSites\\Longueuilife\\App_Data\\dblongueuilife.mdb';Persist Security Info=True");

    sql = "DELETE FROM Messages WHERE (RefMessage = " + refM + ")";
    myConn.Execute(sql);
    myConn.Close();
    Response.Redirect("read.aspx");
%>