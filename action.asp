<html>
<head>
    <%@ codepage=65001%>
    <!--#include virtual="/dbconnect.asp"-->
    <meta http-equiv="Content-Type" charset="UTF-8">
</head>
<body>
<%
    dim sql
    cnn.open dbstring
    if request("method")=1 then
        sql="update " & request("dbname") & " set [" & request("code") & "] =null where id in (" & request("id") & ");"
    elseif request("method")=2 then 
        sql="update " & request("dbname") & " set [" & request("code") & "] =N'" & request("editvalue") & "' where id in (" & request("id") & ");"
    elseif  request("method")=0 then
        sql="delete from " & request("dbname") & " where id in (" & request("id") & ");"
    else
        sql="delete from " & request("dbname") & " where id<>id"
    end if
    cnn.execute sql
    cnn.close()
    set cnn=nothing
    Response.Redirect(request("direct"))
%>
</body>

</html>
