<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO ���Թ�����򡪡��޸�</title>
</head>
<body>
	<h1>���Թ����� ���� MVC + DAOʵ��</h1>
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
			response.setHeader("refresh","2;URL=Note?status=selectall") ;
			boolean b = ((Boolean)request.getAttribute("flag")).booleanValue() ;
			if(b)
			{
	%>
				�����޸ĳɹ����������ת�������б�ҳ������<br/>
				���û����ת���밴 <a href="Note?status=selectall">����</a>������
	<%
			}
			else
			{
	%>
				�����޸�ʧ�ܣ��������ת�������б�ҳ ������<br/>
				���û����ת���밴<a href="Note?status=selectall">����</a>������
	<%
			}
	%>
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