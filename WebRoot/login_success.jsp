<%@ page language="java" contentType="text/html; charset=gbk"
    pageEncoding="gbk"%>
<!DOCTYPE html>
<html>
<head>
    <meta content="text/html; charset=gbk">
	<title>MVC+DAO���Թ������--��½</title>
</head>
<body>
	<h1>���Թ�����--MVC+DAO ʵ��</h1>
	<hr>
	<br>
	<%
		if(session.getAttribute("uname")!=null)
		{
			// �û��ѵ�½
	%>
			<h2>��½�ɹ� </h2>
			<h2>��ӭ <font color="red" size="12">
				<%=session.getAttribute("uname")%>
			</font>����JMU-CEC���Գ���</h2>
			<h3><a href="Note?status=selectall">�������Թ���ҳ��</a></h3>
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