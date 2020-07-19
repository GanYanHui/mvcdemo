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
		// 1、接收传递的参数
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		// 2、将请求的内容赋值给VO类
		Person person = new Person();
		person.setId(id);
		person.setPassword(password);

		try {
			// 进行数据库验证
			if (DAOFactory.getPersonDAOInstance().login(person)) {
				// 如果为真，则表示用户ID和密码合法
				// 设置用户姓名到session范围之中
				request.getSession().setAttribute("uname", person.getName());
				// 修改跳转路径
				path = "login_success.jsp";
			} else {
				// 登陆失败
				// 设置错误信息
				request.setAttribute("err", "错误的用户ID及密码！！！");
			}
		} catch (Exception e) {
		}
		// 进行跳转
		request.getRequestDispatcher(path).forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		this.doPost(request, response);
	}
}
