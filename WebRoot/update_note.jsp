<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO���Թ������--�޸�</title>
</head>
<body>
	<h1>���Թ�����--MVC+DAOʵ��</h1>
	<hr>
	<br>
	<%
		// �������봦��
		request.setCharacterEncoding("GBK") ;
	%>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// �û��ѵ�½
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
				<td colspan="2">�༭���� </td>
			</tr>
			<tr>
				<td>���⣺</td>
				<td><input type="text" name="title" value="<%=title%>"></td>
			</tr>
			<tr>
				<td>���ߣ�</td>
				<td><%=session.getAttribute("uname")%>
				<input type="hidden" name="author" value="<%=session.getAttribute("uname")%>"/></td>
			</tr>
			<tr>
				<td>���ݣ�</td>
				<td><textarea name="content" cols="30" rows="6"><%=content%></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" name="id" value="<%=id%>">
					<input type="hidden" name="status" value="update">
					<input type="submit" value="���� ">
					<input type="reset" value="����">
				</td>
			</tr>
		</table>
	</form>
	<%
			}
			else
			{
	%>
				û�з��֣�Ҫ���µ����ݣ���<br/>
				��ȷ��Ҫ���µ������Ƿ���ڣ���<br/>
	<%
			}
	%>
	<h3><a href="Note?status=selectall">�ص������б�ҳ</a></h3>
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