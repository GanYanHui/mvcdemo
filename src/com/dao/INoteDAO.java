package com.dao;

import java.util.List;
import com.vo.Note;

public interface INoteDAO {
	// 增加操作
	public void insert(Note note) throws Exception;

	// 修改操作
	public void update(Note note) throws Exception;

	// 删除操作
	public void delete(int id) throws Exception;

	// 按ID查询，主要为更新使用
	public Note queryById(int id) throws Exception;

	// 查询全部
	public List<Note> queryAll() throws Exception;

	// 模糊查询
	public List<Note> queryByLike(String cond) throws Exception;
}
