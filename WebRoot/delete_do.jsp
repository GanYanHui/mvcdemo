<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO留言管理程序--删除 </title>
</head>
<body>
	<h1>留言管理范例--MVC+DAO实现 </h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>	
	<%
			response.setHeader("refresh","2;URL=Note?status=selectall") ;
			boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
			if(b)
			{
				
	%>
				留言删除成功，两秒后跳转到留言列表页！！！<br/>
				如果没有跳转，请按 <a href="Note?status=selectall">这里</a>！！！
	<%
			}
			else
			{
	%>
				留言删除失败，两秒后跳转到留言列表页 ！！！<br/>
				如果没有跳转，请按 <a href="Note?status=selectall">这里</a>！！！
	<%
			}
	%>
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