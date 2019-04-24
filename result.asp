<!DOCTYPE html>
<html>

<head>
    <%@ codepage=65001%>
    <meta http-equiv="Content-Type" charset="UTF-8">
    <TITle> 查询结果 </TITle>
    <link href="basic.css" rel="stylesheet" type="text/css" />
    <!--#include virtual="/dbconnect.asp"-->
    <script type="text/javascript" src="jshouse/openmodifyBt.js"></script>
    <script type="text/javascript" src="jshouse/modifyDb.js"></script>


</head>

<body style="text-align:center">
    <div id='filledsearch'>
        <div id="research" style="text-align: left">
            <!--#include virtual="/search.asp"-->
        </div>
        <div id="result" style="width: 90%; vertical-align: middle;height:auto;">
            <table style="border-spacing: 0;width: 100%;border:none">
                <tr style=" height:10px;background: saddlebrown; color : white;border-color: red ">
                    <th style="width:25px"></th>
                    <th style="width:60px">编号</th>
                    <th style="width:20%">中文</th>
                    <th style="width:25%">英文</th>
                    <th>翻译值</th>
                </tr>
                <% 
                cnn.Open dbstring
                sql =  "select id,stdcnname,stdenname,[" & request("code") & "] from StdTranslationCore_Mxd where stdenname like '%" & trim(request("item")) & "%' or stdcnname like '%" & trim(request("item")) & "%'"
                set rs= Server.CreateObject("ADODB.RecordSet")
                rs.Open sql,cnn ,1,1
                do While not rs.eof '循环结果输出
                    response.write("<tr>")
                    response.write("<td style='text-align: center;'><input id='checkbox" & rs(0) & "' name='checked' value='" & rs(0) & "' type='checkbox' style='height:25px;vertical-align: middle' onclick='openmodifyBt(" & rs(0) & ")'></td>")
                    response.write("<td>" & rs(0) & "</td>") 
                    response.write("<td>" & rs(1) & "</td>")
                    response.write("<td>" & rs(2) & "</td>") 
                    response.write("<td> <span id='span" & rs(0) & "' name='value'>" & rs(3) & "</span><input id='input" & rs(0) & "' name='editvalue' style='display: none;font-size:16px;width:100%' type='text' value='" & rs(3) & "'></td>") 
                    response.write("</tr>")
                rs.MoveNext
                Loop
                rs.close()
                set rs=nothing
                cnn.close()
                set conn=nothing
            %>
            </table>
        </div>
    </div>
</body>
<html>