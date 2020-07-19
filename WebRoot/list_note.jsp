<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO留言管理程序 --列表 </title>
</head>
<body>
	<h1>留言管理范例--MVC+DAO实现 </h1>
	<hr>
	<br/>
	<%
		// 编码转换
		request.setCharacterEncoding("GBK") ;
		if(session.getAttribute("uname")!=null)
		{
			// 用户已登陆
	%>
	<%
		// 如果有内容，则修改变量i，如果没有，则根据i的值进行无内容提示
		int i = 0 ;
		String keyword = request.getParameter("keyword") ;
		List all = null ;
		all = (List)request.getAttribute("all") ;
	%>
<form action="Note" method="POST">
	请输入查询内容： <input type="text" name="keyword">
	<input type="hidden" name="status" value="selectbylike">
	<input type="submit" value="查询">
</form>
<h3><a href="insert_note.jsp">添加新留言</a></h3>
<table width="80%" border="1">
	<tr>
		<td>留言ID</td>
		<td>标题 </td>
		<td>作者 </td>
		<td>内容 </td>
		<td>删除 </td>
	</tr>
	<%
			Iterator iter = all.iterator() ;
			while(iter.hasNext())
			{
				Note note = (Note)iter.next() ;
				i++ ;
				// 进行循环打印，打印出所有的内容，以表格形式
				// 从数据库中取出内容
				int id = note.getId() ;
				String title = note.getTitle() ;
				String author = note.getAuthor() ;
				String content = note.getContent() ;
				
				// 因为要关键字返红，所以此处需要接收查询关键字
				// String keyword = request.getParameter("keyword") ;
				if(keyword!=null)
				{
					// 需要将数据返红
					title = title.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
					author = author.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
					content = content.replaceAll(keyword,"<font color=\"red\">"+keyword+"</font>") ;
				}
	%>
				<tr>
					<td><%=id%></td>
					<td><a href="Note?id=<%=id%>&status=selectid"><%=title%></a></td>
					<td><%=author%></td>
					<td><%=content%></td>
					<td><a href="Note?id=<%=id%>&status=delete">删除</a></td>
				</tr>
	<%
			}
			// 判断i的值是否改变，如果改变，则表示有内容，反之，无内容
			if(i==0)
			{
				// 进行提示
	%>
				<tr>
					<td colspan="5">没有任何内容！！！</td>
				</tr>
	<%
			}
	%>
</table>

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