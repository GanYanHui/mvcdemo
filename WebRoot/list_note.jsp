<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<%@ page import="java.util.*"%>
<%@ page import="com.vo.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO���Թ������ --�б� </title>
</head>
<body>
	<h1>���Թ�����--MVC+DAOʵ�� </h1>
	<hr>
	<br/>
	<%
		// ����ת��
		request.setCharacterEncoding("GBK") ;
		if(session.getAttribute("uname")!=null)
		{
			// �û��ѵ�½
	%>
	<%
		// ��������ݣ����޸ı���i�����û�У������i��ֵ������������ʾ
		int i = 0 ;
		String keyword = request.getParameter("keyword") ;
		List all = null ;
		all = (List)request.getAttribute("all") ;
	%>
<form action="Note" method="POST">
	�������ѯ���ݣ� <input type="text" name="keyword">
	<input type="hidden" name="status" value="selectbylike">
	<input type="submit" value="��ѯ">
</form>
<h3><a href="insert_note.jsp">���������</a></h3>
<table width="80%" border="1">
	<tr>
		<td>����ID</td>
		<td>���� </td>
		<td>���� </td>
		<td>���� </td>
		<td>ɾ�� </td>
	</tr>
	<%
			Iterator iter = all.iterator() ;
			while(iter.hasNext())
			{
				Note note = (Note)iter.next() ;
				i++ ;
				// ����ѭ����ӡ����ӡ�����е����ݣ��Ա����ʽ
				// �����ݿ���ȡ������
				int id = note.getId() ;
				String title = note.getTitle() ;
				String author = note.getAuthor() ;
				String content = note.getContent() ;
				
				// ��ΪҪ�ؼ��ַ��죬���Դ˴���Ҫ���ղ�ѯ�ؼ���
				// String keyword = request.getParameter("keyword") ;
				if(keyword!=null)
				{
					// ��Ҫ�����ݷ���
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
					<td><a href="Note?id=<%=id%>&status=delete">ɾ��</a></td>
				</tr>
	<%
			}
			// �ж�i��ֵ�Ƿ�ı䣬����ı䣬���ʾ�����ݣ���֮��������
			if(i==0)
			{
				// ������ʾ
	%>
				<tr>
					<td colspan="5">û���κ����ݣ�����</td>
				</tr>
	<%
			}
	%>
</table>

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