package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.factory.DAOFactory;
import com.vo.Note;
@WebServlet("/Note")
public class NoteServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		request.setCharacterEncoding("GBK");
		String path = "errors.jsp";
		// ����Ҫ�����Ĳ���ֵ
		String status = request.getParameter("status");
		if (status != null) {
			// ���������ݣ�֮��ѡ����ʵķ���
			// ��ѯȫ������
			if ("selectall".equals(status)) {
				try {
					request.setAttribute("all", DAOFactory.getNoteDAOInstance()
							.queryAll());
				} catch (Exception e) {
				}
				path = "list_note.jsp";
			}
			// �������
			if ("insert".equals(status)) {
				// 1�����ղ������Ϣ
				String title = request.getParameter("title");
				String author = request.getParameter("author");
				String content = request.getParameter("content");
				// 2��ʵ����VO����
				Note note = new Note();
				note.setTitle(title);
				note.setAuthor(author);
				note.setContent(content);
				// 3������DAO������ݿ�Ĳ������
				boolean flag = false;
				try {
					DAOFactory.getNoteDAOInstance().insert(note);
					flag = true;
				} catch (Exception e) {
				}
				request.setAttribute("flag", new Boolean(flag));
				path = "insert_do.jsp";
			}
			// ��ID��ѯ�������޸�֮ǰ��Ҫ�������Ȳ�ѯ����
			if ("selectid".equals(status)) {
				// ���ղ���
				int id = 0;
				try {
					id = Integer.parseInt(request.getParameter("id"));
				} catch (Exception e) {
				}
				try {
					request.setAttribute("note", DAOFactory
							.getNoteDAOInstance().queryById(id));
				} catch (Exception e) {
				}
				path = "update_note.jsp";
			}
			// ���²���
			if ("update".equals(status)) {
				int id = 0;
				try {
					id = Integer.parseInt(request.getParameter("id"));
				} catch (Exception e) {
				}
				String title = request.getParameter("title");
				String author = request.getParameter("author");
				String content = request.getParameter("content");
				Note note = new Note();
				note.setId(id);
				note.setTitle(title);
				note.setAuthor(author);
				note.setContent(content);
				boolean flag = false;
				try {
					DAOFactory.getNoteDAOInstance().update(note);
					flag = true;
				} catch (Exception e) {
				}
				request.setAttribute("flag", new Boolean(flag));
				path = "update_do.jsp";
			}
			// ģ����ѯ
			if ("selectbylike".equals(status)) {
				String keyword = request.getParameter("keyword");
				try {
					request.setAttribute("all", DAOFactory.getNoteDAOInstance()
							.queryByLike(keyword));
				} catch (Exception e) {
				}
				path = "list_note.jsp";
			}
			// ɾ������
			if ("delete".equals(status)) {
				// ���ղ���
				int id = 0;
				try {
					id = Integer.parseInt(request.getParameter("id"));
				} catch (Exception e) {
				}
				boolean flag = false;
				try {
					DAOFactory.getNoteDAOInstance().delete(id);
					flag = true;
				} catch (Exception e) {
				}
				request.setAttribute("flag", new Boolean(flag));
				path = "delete_do.jsp";
			}
		} else {
			// ���ʾ�޲������Ƿ��Ŀͻ�����
		}
		request.getRequestDispatcher(path).forward(request, response);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {
		this.doPost(request, response);
	}
}
