package com.dao.impl;

import java.sql.*;

import com.dao.IPersonDAO;
import com.dbc.ConnectionManager;
import com.vo.Person;

public class PersonDAOImpl implements IPersonDAO {
	/*
	 * ���ܣ� �� �ж��Ƿ�����ȷ���û��������� �� �����ݿ���ȡ���û�����ʵ����
	 */
	public boolean login(Person person) throws Exception {
		boolean flag = false;
	    Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql = "SELECT name FROM person WHERE id=? and password=?";
		try {
			conn=ConnectionManager.getConnection();
		    pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, person.getId());
			pstmt.setString(2, person.getPassword());
			rs = pstmt.executeQuery();
			if (rs.next()) {
				flag = true;
				person.setName(rs.getString(1));
			}

		} catch (Exception e) {
			throw new Exception("�������ִ��󣡣���");
		} finally {
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closeStatement(pstmt);
			ConnectionManager.closeConnection(conn);
		}
		return flag;
	}
}
