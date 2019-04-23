<%
'ole db连接
set cnn = Server.CreateObject("ADODB.Connection") '连接串需要注意sqlserver的实例名，是否是默认，非默认必须要写出来
dim dbstring
dbstring = "provider=sqloledb;Data Source=192.168.3.60;Initial Catalog=Nop37_Dev;User Id=sa;Pwd=pass@word+123;"
%>