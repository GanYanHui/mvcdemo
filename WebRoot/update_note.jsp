<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO留言管理程序--修改</title>
</head>
<body>
	<h1>留言管理范例--MVC+DAO实现</h1>
	<hr>
	<br>
	<%
		// 进行乱码处理
		request.setCharacterEncoding("GBK") ;
	%>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>		
	<%
		Note note = (Note)request.getAttribute("note") ;
	%>
	<%
			if(note!=null)
			{
				int id = note.getId() ;
				String title = note.getTitle() ;
				String author = note.getAuthor() ;
				String content = note.getContent() ;
	%>
	<form action="Note" method="post">
		<table>
			<tr>
				<td colspan="2">编辑留言 </td>
			</tr>
			<tr>
				<td>标题：</td>
				<td><input type="text" name="title" value="<%=title%>"></td>
			</tr>
			<tr>
				<td>作者：</td>
				<td><%=session.getAttribute("uname")%>
				<input type="hidden" name="author" value="<%=session.getAttribute("uname")%>"/></td>
			</tr>
			<tr>
				<td>内容：</td>
				<td><textarea name="content" cols="30" rows="6"><%=content%></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="status" value="update">
					<input type="submit" value="更新 ">
					<input type="reset" value="重置">
				</td>
			</tr>
		</table>
	</form>
	<%
			}
			else
			{
	%>
				没有发现，要更新的内容！！<br/>
				请确认要更新的留言是否存在！！<br/>
	<%
			}
	%>
	<h3><a href="Note?status=selectall">回到留言列表页</a></h3>
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