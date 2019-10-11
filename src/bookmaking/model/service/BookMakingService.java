package bookmaking.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;
import book.model.vo.Book;
import bookmaking.model.dao.BookMakingDao;

public class BookMakingService {
	//의존성 주입
	private static BookMakingDao bmDao = new BookMakingDao();
	
	public BookMakingService() {}
	
	//도서제작 메인 리스트
	public ArrayList<Book> selectMakingBook(String bookcode){
		Connection conn = getConnection();
		ArrayList<Book> list = bmDao.selectMakingBook(conn, bookcode);
		close(conn);
		return list;
	}
	
	//제작해야할 도서 게시물 카운트
	public int getListCountWaiting(){
		return 0;
	}
	
	//제작해야할 도서 리스트
	public ArrayList<Book> selectWaitingBookList(String bookcode){
		return null;
	}
	
	//제작중 도서 게시물 카운트
	public int getListCountMaking(){
		return 0;
	}
	
	//제작중 도서 리스트
	public ArrayList<Book> selectMakingBookList(String bookcode){
		return null;
	}
	
	//도서 상세정보 
	public Book selectMakingBookOne(String bookcode){
		Connection conn = getConnection();
		Book book = bmDao.selectMakingBookOne(conn, bookcode);
		close(conn);
		return book;
	}
	
	//불러올 pdf 리스트
	public ArrayList<Book> selectBookPdfLoad(){
		return null;
	}
	
	//제작완료 도서  카운트
	public int getMakedBookCount(){
		return 0;
	}
	
}
