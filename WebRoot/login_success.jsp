<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO留言管理程序--登陆</title>
</head>
<body>
	<h1>留言管理范例--MVC+DAO 实现</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
			<h2>登陆成功 </h2>
			<h2>欢迎 <font color="red" size="12">
				<%=session.getAttribute("uname")%>
			</font>光临JMU-CEC留言程序</h2>
			<h3><a href="Note?status=selectall">进入留言管理页面</a></h3>
	<%
		}
		else
		{
			// 用户未登陆，提示用户登陆，并跳转
			response.setHeader("refresh","2;URL=login.jsp") ;
	%>
			您还未登陆，请先登陆！！！<br/>
			两秒后跳转到登陆页面！！！<br/>
			如果没有跳转，请按<a href="login.jsp">这里 </a>！！！<br/>
	<%
		}
	%>
</body>
</html>