<%@ page language="java"  pageEncoding="gbk"%>
<!DOCTYPE HTML>
<html>
  <head>
    <meta content="text/html;charset=gbk">
    <title>��½ҳ��</title>
  </head>
  
  <body>
   <h1>���Թ������--��½ҳ��</h1>
   	<hr/>
	<br/>
	<%
		// �ж��Ƿ��д�����Ϣ����������ӡ
		// ���û�д˶δ��룬����ʾʱ��ֱ�Ӵ�ӡnull
		if(request.getAttribute("err")!=null)
		{
	%>
			<h2><%=request.getAttribute("err")%></h2>
	<%
		}
	%>
	<form action="Login" method="post">
	�û�ID:<input type="text" name="id"/><br/>
	���룺<input type="password" name="password"/><br/>
	<input type="submit" value="��½ "/>
	<input type="reset" value="���� "/>
	</form>
  </body>
</html>
