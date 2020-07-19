package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.vo.Person;
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		String path = "login.jsp";
		// 1�����մ��ݵĲ���
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		// 2������������ݸ�ֵ��VO��
		Person person = new Person();
		person.setId(id);
		person.setPassword(password);

		try {
			// �������ݿ���֤
			if (DAOFactory.getPersonDAOInstance().login(person)) {
				// ���Ϊ�棬���ʾ�û�ID������Ϸ�
				// �����û�������session��Χ֮��
				request.getSession().setAttribute("uname", person.getName());
				// �޸���ת·��
				path = "login_success.jsp";
			} else {
				// ��½ʧ��
				// ���ô�����Ϣ
				request.setAttribute("err", "������û�ID�����룡����");
			}
		} catch (Exception e) {
		}
		// ������ת
		request.getRequestDispatcher(path).forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		this.doPost(request, response);
	}
}
