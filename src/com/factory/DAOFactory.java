package com.factory;

import com.dao.INoteDAO;
import com.dao.IPersonDAO;
import com.dao.impl.NoteDAOImpl;
import com.dao.impl.PersonDAOImpl;

public class DAOFactory {
	public static IPersonDAO getPersonDAOInstance()
	{
		return new PersonDAOImpl() ;
	}

	public static INoteDAO getNoteDAOInstance()
	{
		return new NoteDAOImpl() ;
	}
}
