<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO���Գ���--���</title>
</head>
<body>
	<h1>���Թ�����--MVC+DAOʵ��</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// �û��ѵ�½
	%>
	<form action="Note" method="post">
		<table>
			<tr>
				<td colspan="2">���������</td>
			</tr>
			<tr>
				<td>���⣺ </td>
				<td><input type="text" name="title"></td>
			</tr>
			<tr>
				<td>���ߣ�</td>
				<td><%=session.getAttribute("uname")%>
				<input type="hidden" name="author" value="<%=session.getAttribute("uname")%>"/></td>
			</tr>
			<tr>
				<td>���ݣ�</td>
				<td><textarea name="content" cols="30" rows="6"></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="status" value="insert">
					<input type="submit" value="���">
					<input type="reset" value="����">
				</td>
			</tr>
		</table>
	</form>
	<h3><a href="list_note.jsp">�ص������б�ҳ</a></h3>
	<%
		}
		else
		{
			// �û�δ��½����ʾ�û���½������ת
			response.setHeader("refresh","2;URL=login.jsp") ;
	%>
			����δ��½�����ȵ�½������<br/>
			�������ת����½ҳ�棡����<br/>
			���û����ת���밴<a href="login.jsp">���� </a>������<br/>
	<%
		}
	%>
</body>
</html>