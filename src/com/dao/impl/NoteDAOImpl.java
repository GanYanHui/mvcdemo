package com.dao.impl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.dao.INoteDAO;
import com.dbc.ConnectionManager;
import com.vo.Note;

public class NoteDAOImpl implements INoteDAO {
	// 增加操作
		public void insert(Note note) throws Exception
		{
			String sql = "INSERT INTO note(title,author,content) VALUES(?,?,?)" ;
		    Connection conn=null;
			PreparedStatement pstmt=null;
			try
			{
				conn=ConnectionManager.getConnection();
			    pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,note.getTitle()) ;
				pstmt.setString(2,note.getAuthor()) ;
				pstmt.setString(3,note.getContent()) ;
				pstmt.executeUpdate() ;
			}
			catch (Exception e)
			{
				// System.out.println(e) ;
				throw new Exception("操作中出现错误！！！") ;
			}
			finally
			{
				ConnectionManager.closeStatement(pstmt);
				ConnectionManager.closeConnection(conn);
			}
		}
		// 修改操作
		public void update(Note note) throws Exception
		{
			String sql = "UPDATE note SET title=?,author=?,content=? WHERE id=?" ;
		    Connection conn=null;
			PreparedStatement pstmt=null;
			try
			{
				conn=ConnectionManager.getConnection();
			    pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,note.getTitle()) ;
				pstmt.setString(2,note.getAuthor()) ;
				pstmt.setString(3,note.getContent()) ;
				pstmt.setInt(4,note.getId()) ;
				pstmt.executeUpdate() ;
			}
			catch (Exception e)
			{
				throw new Exception("操作中出现错误！！！") ;
			}
			finally
			{
				ConnectionManager.closeStatement(pstmt);
				ConnectionManager.closeConnection(conn);
			}
		}
		// 删除操作
		public void delete(int id) throws Exception
		{
			String sql = "DELETE FROM note WHERE id=?" ;
		    Connection conn=null;
			PreparedStatement pstmt=null;
			try
			{
				conn=ConnectionManager.getConnection();
			    pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,id) ;
				pstmt.executeUpdate() ;
			}
			catch (Exception e)
			{
				throw new Exception("操作中出现错误！！！") ;
			}
			finally
			{
				ConnectionManager.closeStatement(pstmt);
				ConnectionManager.closeConnection(conn);
			}
		}
		// 按ID查询，主要为更新使用
		public Note queryById(int id) throws Exception
		{
			Note note = null ;
			String sql = "SELECT id,title,author,content FROM note WHERE id=?" ;
		    Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try
			{
				conn=ConnectionManager.getConnection();
			    pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1,id) ;
				rs = pstmt.executeQuery() ;
				if(rs.next())
				{
					note = new Note() ;
					note.setId(rs.getInt(1)) ;
					note.setTitle(rs.getString(2)) ;
					note.setAuthor(rs.getString(3)) ;
					note.setContent(rs.getString(4)) ;
				}
			}
			catch (Exception e)
			{
				throw new Exception("操作中出现错误！！！") ;
			}
			finally
			{
				ConnectionManager.closeResultSet(rs);
				ConnectionManager.closeStatement(pstmt);
				ConnectionManager.closeConnection(conn);
			}
			return note ;
		}
		// 查询全部
		public List<Note> queryAll() throws Exception
		{
			List<Note> all = new ArrayList<Note>() ;
			String sql = "SELECT id,title,author,content FROM note" ;
		    Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try
			{
				conn=ConnectionManager.getConnection();
			    pstmt=conn.prepareStatement(sql);
				rs = pstmt.executeQuery() ;
				while(rs.next())
				{
					Note note = new Note() ;
					note.setId(rs.getInt(1)) ;
					note.setTitle(rs.getString(2)) ;
					note.setAuthor(rs.getString(3)) ;
					note.setContent(rs.getString(4)) ;
					all.add(note) ;
				}
			}
			catch (Exception e)
			{
				System.out.println(e) ;
				throw new Exception("操作中出现错误！！！") ;
			}
			finally
			{
				ConnectionManager.closeResultSet(rs);
				ConnectionManager.closeStatement(pstmt);
				ConnectionManager.closeConnection(conn);
			}
			return all ;
		}
		// 模糊查询
		public List<Note> queryByLike(String cond) throws Exception
		{
			List<Note> all = new ArrayList<Note>() ;
			String sql = "SELECT id,title,author,content FROM note WHERE title LIKE ? or AUTHOR LIKE ? or CONTENT LIKE ?" ;
		    Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try
			{
				conn=ConnectionManager.getConnection();
			    pstmt=conn.prepareStatement(sql);
				pstmt.setString(1,"%"+cond+"%") ;
				pstmt.setString(2,"%"+cond+"%") ;
				pstmt.setString(3,"%"+cond+"%") ;
				rs = pstmt.executeQuery() ;
				while(rs.next())
				{
					Note note = new Note() ;
					note.setId(rs.getInt(1)) ;
					note.setTitle(rs.getString(2)) ;
					note.setAuthor(rs.getString(3)) ;
					note.setContent(rs.getString(4)) ;
					all.add(note) ;
				}
			}
			catch (Exception e)
			{
				System.out.println(e) ;
				throw new Exception("操作中出现错误！！！") ;
			}
			finally
			{
				ConnectionManager.closeResultSet(rs);
				ConnectionManager.closeStatement(pstmt);
				ConnectionManager.closeConnection(conn);
			}
			return all ;
		}
}
