package com.dao;

import java.util.List;
import com.vo.Note;

public interface INoteDAO {
	// ���Ӳ���
	public void insert(Note note) throws Exception;

	// �޸Ĳ���
	public void update(Note note) throws Exception;

	// ɾ������
	public void delete(int id) throws Exception;

	// ��ID��ѯ����ҪΪ����ʹ��
	public Note queryById(int id) throws Exception;

	// ��ѯȫ��
	public List<Note> queryAll() throws Exception;

	// ģ����ѯ
	public List<Note> queryByLike(String cond) throws Exception;
}
