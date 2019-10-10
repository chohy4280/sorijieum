package bookmaking.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import book.model.vo.Book;

public class BookMakingDao {

	public BookMakingDao() {}
	
	public ArrayList<Book> selectMakingBook(Connection conn, int bookcode){
		return null;
	}
	
	public int getListCountWaiting(Connection conn){
		return 0;
	}
	
	public ArrayList<Book> selectWaitingBookList(Connection conn, int bookcode){
		return null;
	}
	
	public int getListCountMaking(Connection conn){
		return 0;
	}
	
	public ArrayList<Book> selectMakingBookList(Connection conn, int bookcode){
		return null;
	}
	
	public Book selectMakingBookOne(Connection conn, int bookcode){
		return null;
	}
	
	public ArrayList<Book> selectBookPdfLoad(Connection conn){
		return null;
	}
	
	public int getMakedBookCount(Connection conn){
		return 0;
	}
}
