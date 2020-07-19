package com.dao.impl;

import java.sql.*;

import com.dao.IPersonDAO;
import com.dbc.ConnectionManager;
import com.vo.Person;

public class PersonDAOImpl implements IPersonDAO {
	/*
	 * 功能： · 判断是否是正确的用户名或密码 · 从数据库中取出用户的真实姓名
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
			throw new Exception("操作出现错误！！！");
		} finally {
			ConnectionManager.closeResultSet(rs);
			ConnectionManager.closeStatement(pstmt);
			ConnectionManager.closeConnection(conn);
		}
		return flag;
	}
}
