<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO留言程序--添加</title>
</head>
<body>
	<h1>留言管理范例--MVC+DAO实现</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<form action="Note" method="post">
		<table>
			<tr>
				<td colspan="2">添加新留言</td>
			</tr>
			<tr>
				<td>标题： </td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><%=session.getAttribute("uname")%>
				<input type="hidden" name="author" value="<%=session.getAttribute("uname")%>"/></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td><textarea name="content" cols="30" rows="6"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="status" value="insert">
					<input type="submit" value="添加">
					<input type="reset" value="重置">
				</td>
			</tr>
		</table>
	</form>
	<h3><a href="list_note.jsp">回到留言列表页</a></h3>
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