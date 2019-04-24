<div id="search" style="width: 90%; vertical-align: middle;height:100%;">
    <div id='form' style="display: inline-block; width: 75%">
        <form action="result.asp" method="get" style="vertical-align:middle;">
            <div id="input" style="width: 100%;vertical-align:middle;">
                <input id="searchitem" name="item" type="text" placeholder=" 请输入您要查询的关键字"
                    value='<%response.write request("item")%>'
                    style="height: 50px; width: 450px;border-bottom:1px solid #ff6a00;cursor:text" />
                <select id="select" name="code" style="height: 50px;width: 100px;padding-top: 1px">

                    <% if Request.ServerVariables("URL") ="/result.asp" then
                    response.write("<option selected='selected' value='" & request("code") & "'>" & request("code") & "</option>")
                %>
                    <% else %>
                    <option value="StdENName" selected="selected">en_US</option>
                    <%  
                    cnn.Open dbstring
                    sql =  "select name from syscolumns where id=614345303 and name not in ('StdCNName','StdENName','id')  order by left(name,2) "
                    set rs= Server.CreateObject("ADODB.RecordSet")
                    rs.Open sql,cnn ,1,1
                    do While not rs.eof '循环结果输出
                        response.write("<option value='" & rs(0) & "'>" & rs(0) & "</option>")
                    rs.MoveNext
                    Loop
                    rs.close()
                    cnn.close()
                %>
                </select>
                <% end if%>
                <input type="submit" value="搜索"
                    style="height: 50px;width:100px;border: 1px solid #ff6a00;float:inline-start"
                    onclick=" return checkvalue()" />
            </div>
        </form>
    </div>
    <div id="operation" name="openmodify" style="display: inline-block;text-align: right;display: none">
        <button onclick="modifyDb(0)" id="fulldelete"
            style="height:50px;width:70px;background-color: rgb(1, 60, 255);font-weight: bold ;color: white;">词条删除</button>
        <button onclick="modifyDb(1)" id="transdelete"
            style="height:50px;width:70px;background-color: black;font-weight: bold ;color: white;">翻译删除</button>
        <button onclick="modifyDb(2)" id="transmodify"
            style="height:50px;width:70px;background-color: rgb(231, 39, 14);font-weight: bold ;color: white;">修改</button>

    </div>
</div>
<script type="text/javascript" src="search.js"></script>
<script type="text/javascript" src="jshouse/search.js"></script>