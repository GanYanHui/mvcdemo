<%@ page language="java"  pageEncoding="gbk"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta content="text/html;charset=gbk">
    <title>登陆页面</title>
  </head>
  
  <body>
   <h1>留言管理程序--登陆页面</h1>
   	<hr/>
	<br/>
	<%
		// 判断是否有错误信息，如果有则打印
		// 如果没有此段代码，则显示时会直接打印null
		if(request.getAttribute("err")!=null)
		{
	%>
			<h2><%=request.getAttribute("err")%></h2>
	<%
		}
	%>
	<form action="Login" method="post">
	用户ID:<input type="text" name="id"/><br/>
	密码：<input type="password" name="password"/><br/>
	<input type="submit" value="登陆 "/>
	<input type="reset" value="重置 "/>
	</form>
  </body>
</html>
